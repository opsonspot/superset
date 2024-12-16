import dash
from urllib.parse import urlparse
from urllib.parse import parse_qs
from dash import html, dcc
from cards import kpi_card
from layout import nav_layout, \
    kpi_cards_layout, \
    overall_layout, \
    form_layout, \
    content_wrapper, \
    calendar_layout, \
    iframe_layout
from database import Event
from dash import Input, Output, State
from constants import (SUPERSET_IP,
                       PERFORMANCE_TRACKER_DASH_NUM,
                       EVENT_MANAGER_DASH_NUM,
                       FAILURE_PREDICTOR_DASH_NUM)
import os
import dash_bootstrap_components as dbc

app = dash.Dash(__name__)
app.title = 'Golgix MIP'
server = app.server

# Remember, for additional tabs, layouts must callback to the inner id of the nav_layout
app.layout = html.Div(children=[
    html.Div([
            dbc.Modal([
                dbc.ModalBody("",
                    style={"background-color": "white",
                           "color": "black"},
                    id="modal-body")
                ],
            id="modal",
            size="xl",
            is_open=False)
        ]),
    html.Div(id='nothing_div'),
    dcc.Location(id='url'),
    nav_layout()
])


# Callbacks for the nav bar
@app.callback(Output('activated', 'className'),
              Input('activate', 'n_clicks'))
def activate(x):
    if x is None:
        return 'container-scroller'
    elif (x + 1) % 2 == 0:
        return 'container-scroller sidebar-icon-only'
    return 'container-scroller'


@app.callback(Output('profile_dropdown', 'className'),
              Input('profile_arrow', 'n_clicks'),
              Input('user_name', 'n_clicks'))
def profile_dropdown(x1, x2):
    closed_class = 'dropdown-menu dropdown-menu-right navbar-dropdown preview-list'
    x1 = 0 if x1 is None else x1
    x2 = 0 if x2 is None else x2
    x = x1 + x2
    if x == 0:
        return closed_class
    if x % 2 == 0:
        return closed_class
    elif x % 2 != 0:
        return closed_class + ' show'
    return closed_class


# Callback for initializing and allowing the user to switch to multiple tabs
@app.callback(Output('item1', 'className'),
              Output('item2', 'className'),
              Output('item4', 'className'),
              Output('inner', 'children'),
              Output('modal', 'is_open'),
              Output('modal-body', 'children'),
              Input('url', 'href'),
              Input('item1', 'n_clicks'),
              Input('item2', 'n_clicks'),
              Input('item4', 'n_clicks'),
              State('modal', 'is_open'))
def contents_changer(w, x, y, a, s):
    is_form = False
    captured_value = None
    # Default contents
    if 'form' in w:
        try:
            parsed_url = urlparse(w)
            captured_value = int(parse_qs(parsed_url.query)['event_id'][0])
            is_form = True
        except KeyError:
            is_form = False
    if 'form' in w and is_form:
        return ('nav-item menu-items',
                'nav-item menu-items',
                'nav-item menu-items',
                content_wrapper([
                    html.Iframe(src='http://' + SUPERSET_IP + ':8088/superset/dashboard/' + FAILURE_PREDICTOR_DASH_NUM + '?standalone=3&expand_filters=0',
                        height='100%', width='100%', name='failure_predictor')
                    ]),
                True,
                overall_layout(captured_value))
    default = 'nav-item menu-items'
    performance_tracker = content_wrapper([
        html.Iframe(src='http://' + SUPERSET_IP + ':8088/superset/dashboard/' +
                        PERFORMANCE_TRACKER_DASH_NUM + '?standalone=3&expand_filters=0',
                    height='100%',
                    width='100%')])
    failure_predictor = content_wrapper([
        html.Iframe(src='http://' + SUPERSET_IP + ':8088/superset/dashboard/' +
                        FAILURE_PREDICTOR_DASH_NUM + '?standalone=3&expand_filters=0',
                    height='100%',
                    width='100%')])
    event_manager = content_wrapper([
        html.Iframe(src='http://' + SUPERSET_IP + ':8088/superset/dashboard/' +
                        EVENT_MANAGER_DASH_NUM + '?standalone=3&expand_filters=0',
                    height='100%',
                    width='100%',
                    name='event_manager')])

    # Context of the the sidebar tab buttons drives view changes
    ctx = dash.callback_context
    if not ctx.triggered:
        return None
    else:
        button_id = ctx.triggered[0]['prop_id'].split('.')[0]
    if button_id is not None:
        triggers = list()
        for each in ('item1', 'item2', 'item4'):
            if each == button_id:
                triggers.append(default + ' active')
            else:
                triggers.append(default)
        if button_id == 'item1':
            triggers.append(performance_tracker)
        #elif button_id == 'item2':
        #    triggers.append(failure_predictor)
        elif button_id == 'item4':
            triggers.append(event_manager)
        else:
            triggers.append(failure_predictor)
        triggers.append(False)
        triggers.append('')
        return tuple(triggers)


@app.callback(
    Output('nothing_div', 'children'),
    Input('submit', 'n_clicks'),
    Input('url', 'href'),
    Input('select_location', 'value'),
    Input('select_severity', 'value'),
    Input('select_status', 'value'),
    Input('select_comments', 'value'),
    Input('select_expert', 'value')
)
def update_output(n_clicks, w, location, severity, status, comments, expert):
    event = Event()
    if n_clicks is None:
        n_clicks = 0
    if n_clicks > 0:
        parsed_url = urlparse(w)
        captured_value = int(parse_qs(parsed_url.query)['event_id'][0])
        if location is None:
            location = event.location(captured_value)
        if severity is None:
            severity = event.severity(captured_value)
        if status is None:
            status = event.status(captured_value)
        if comments is None:
            comments = event.comments(captured_value)
        if expert is None:
            comments = event.expert(captured_value)
        event.write(captured_value, 'Comments', str(comments))
        event.write(captured_value, 'Severity', str(severity))
        event.write(captured_value, 'Status', str(status))
        event.write(captured_value, 'Location', str(location))
        event.write(captured_value, 'Expert_Remedy', str(expert))
    return ''


if __name__ == '__main__':
    server.run(host='0.0.0.0', port=5000)
