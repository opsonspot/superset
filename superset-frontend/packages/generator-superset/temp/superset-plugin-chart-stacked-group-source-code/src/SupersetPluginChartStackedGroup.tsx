/* eslint-disable prettier/prettier */
/**
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */
import React, { createRef } from 'react';
import { styled } from '@superset-ui/core';
import {
  SupersetPluginChartStackedGroupProps,
  SupersetPluginChartStackedGroupStylesProps,
} from './types';
import {
  BarChart,
  Bar,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  Legend,
  ResponsiveContainer,
} from 'recharts';

// The following Styles component is a <div> element, which has been styled using Emotion
// For docs, visit https://emotion.sh/docs/styled

// Theming variables are provided for your use via a ThemeProvider
// imported from @superset-ui/core. For variables available, please visit
// https://github.com/apache-superset/superset-ui/blob/master/packages/superset-ui-core/src/style/index.ts

const Styles = styled.div<SupersetPluginChartStackedGroupStylesProps>`
  background-color: ${({ theme }) => theme.colors.primary.light5};
  padding: ${({ theme }) => theme.gridUnit * 4}px;
  border-radius: ${({ theme }) => theme.gridUnit * 2}px;
  height: ${({ height }) => height}px;
  width: ${({ width }) => width}px;

  h3 {
    /* You can use your props to control CSS! */
    margin-top: 0;
    margin-bottom: ${({ theme }) => theme.gridUnit * 3}px;
    font-size: ${({ theme, headerFontSize }) =>
      theme.typography.sizes[headerFontSize]}px;
    font-weight: ${({ theme, boldText }) =>
      theme.typography.weights[boldText ? 'bold' : 'normal']};
  }

  pre {
    height: ${({ theme, headerFontSize, height }) =>
      height - theme.gridUnit * 12 - theme.typography.sizes[headerFontSize]}px;
  }
`;

export default function SupersetPluginChartStackedGroup(
  props: SupersetPluginChartStackedGroupProps,
) {
  // height and width are the height and width of the DOM element as it exists in the dashboard.
  // There is also a `data` prop, which is, of course, your DATA 🎉
  const { data, height, width } = props;

  const rootElem = createRef<HTMLDivElement>();

  const groupBy = Object.keys(data[0])[0];
  const stackTogether = false;
  const stackedBykeys = Object.keys(data[0]).filter(key => key !== groupBy);
  const getRandomColor = () => {
    const color = `hsl(${Math.random() * 360}, 100%, 75%)`;
    return color;
  };
  const COLORS = stackedBykeys.map(() => getRandomColor());
  const groupedBars: { [key: string]: string[] } = {};
  stackedBykeys.forEach(key => {
    const group = key.split('-')[0]; // Extract Q1, Q2, etc.
    if (!groupedBars[group]) {
      groupedBars[group] = [];
    }
    groupedBars[group].push(key);
  });

  return (
    <Styles
      ref={rootElem}
      boldText={props.boldText}
      headerFontSize={props.headerFontSize}
      height={height}
      width={width}
    >
      <ResponsiveContainer width="100%" height="100%">
        <BarChart
          data={data}
          margin={{ top: 20, right: 30, left: 20, bottom: 10 }}
        >
          <CartesianGrid strokeDasharray="3 3" />
          <XAxis dataKey={groupBy} />
          <YAxis />
          <Tooltip />
          <Legend />

          {Object.keys(groupedBars).map((group, groupIndex) =>
            groupedBars[group].map((subKey, subIndex) => (
              <Bar
                key={subKey}
                dataKey={subKey}
                stackId={stackTogether ? 'all' : `group-${groupIndex}`}
                fill={COLORS[(groupIndex * 2 + subIndex) % COLORS.length]}
              />
            )),
          )}
        </BarChart>
      </ResponsiveContainer>
    </Styles>
  );
}
