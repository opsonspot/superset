### Superset Plugin: Stacked Grouped Bar Chart
Stacked grouped bar charts allow users to compare multiple categories while also visualizing the proportional contribution of subcategories within each group. Unlike standard bar charts, this plugin enables both grouping and stacking in a single visualization, making it easier to analyze complex datasets in Apache Superset.

### Features
- ✔ Supports Both Grouping and Stacking – View category-wise comparisons while stacking related subcategories.
- ✔ Dynamic Data Handling – Automatically detects categories and subcategories from the dataset.
- ✔ Interactive Tooltips & Legends – Helps in understanding data distribution.
- ✔ Random Colors – Ensures better visual distinction between stacked values.
- ✔ Works with Any Dataset – Ideal for sales performance, financial reports, website analytics, inventory tracking, and more.

### Use Cases
- Sales Performance – Compare quarterly sales by region, with product categories stacked within each quarter.
- Website Traffic Analysis – Analyze monthly traffic sources, stacked by device type.
- Financial Reports – Visualize revenue distribution by region, stacked by product type.
- Energy Consumption – Compare industry-wise energy usage, stacked by energy source.

### Installation
To install this plugin in Apache Superset, run:

```
npm install superset-plugin-chart-stacked-group
```
Then, register the plugin in Superset’s visualization presets:

```
import StackedGroupedBarChartPlugin from 'superset-plugin-chart-stacked-group';

new MainPreset().register({
  plugins: [new StackedGroupedBarChartPlugin()],
});
```

Rebuild Superset:

```
npm run build
npm run dev-server
```