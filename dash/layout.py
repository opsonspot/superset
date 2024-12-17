from dash import html, dcc
from database import Event
from constants import SUPERSET_IP, EVENT_MANAGER_DASH_NUM, FAILURE_PREDICTOR_DASH_NUM


def iframe_layout(iframes):
    columns = [html.Div(className='col-xl-3 col-sm-6 grid-margin stretch-card',
                        children=each)
               for each in iframes]
    inner = html.Div(children=[
        html.Div(className='row', children=columns)
    ])
    return inner


def content_wrapper(layouts: list):
    inner = html.Div(className='content-wrapper',
                     children=[
                         x for x in layouts
                     ])
    return inner


def form_layout(event_id=1):
    event = Event()
    location_options = ['G1', 'G2', 'G3', 'Former']
    location_options = [{'label': x, 'value': x} for x in location_options]
    status_options = ['Open', 'In review', 'Closed']
    status_options = [{'label': x, 'value': x} for x in status_options]
    severity_options = ['Low', 'Medium', 'High']
    severity_options = [{'label': x, 'value': x} for x in severity_options]
    cards = html.Div(className='card w-100',
                     children=[
                         html.Div(className='card-body',
                                  children=[
                                      html.H4(className='card-title', children='Update Event Manager'),
                                      html.P(className='card-description',
                                             children='Use the following form to update the Event Manager.'),
                                      html.P(className='card-description',
                                             children='Disclaimer: Please use submit button to close this window, even if no changes have been made.'),
                                      html.Form(className='forms-sample',
                                                children=[
                                                    html.Div(className='form-group',
                                                             children=[
                                                                 html.Label(children='Location',
                                                                            style={'color': 'black',
                                                                                   'margin-top': '20px'},
                                                                            className='form-check-label'),
                                                                 html.Div(children=[
                                                                     dcc.Dropdown(id='select_location',
                                                                                  style={'margin-top': '20px'},
                                                                                  value=event.location(event_id),
                                                                                  options=[
                                                                                      *location_options
                                                                                  ])], id='layout-content'),
                                                                 html.Label(children='Status',
                                                                            style={'color': 'black',
                                                                                   'margin-top': '20px'},
                                                                            className='form-check-label'),
                                                                 html.Div(children=[
                                                                     dcc.Dropdown(id='select_status',
                                                                                  style={'margin-top': '20px'},
                                                                                  value=event.status(event_id),
                                                                                  options=[
                                                                                      *status_options
                                                                                  ])
                                                                 ], id='layout-content'),
                                                                 html.Label(children='Severity',
                                                                            style={'color': 'black',
                                                                                   'margin-top': '20px'},
                                                                            className='form-check-label'),
                                                                 html.Div(children=[
                                                                     dcc.Dropdown(id='select_severity',
                                                                                  style={'margin-top': '20px'},
                                                                                  value=event.severity(event_id),
                                                                                  options=[
                                                                                      *severity_options
                                                                                  ])
                                                                 ], id='layout-content'),
                                                                 html.Label(children='Comments',
                                                                            style={'color': 'black',
                                                                                   'margin-top': '20px'},
                                                                            className='form-check-label'),
                                                                 html.Div(children=[
                                                                     dcc.Input(type='text', className='form-control',
                                                                               id='select_comments',
                                                                               value=event.comments(event_id),
                                                                               style={'margin-top': '20px'})
                                                                 ], id='layout-content'),
                                                                 html.Label(children='Expert Remedy',
                                                                            style={'color': 'black',
                                                                                   'margin-top': '20px'},
                                                                            className='form-check-label'),
                                                                 html.Div(children=[
                                                                     dcc.Input(type='text', className='form-control',
                                                                               id='select_expert',
                                                                               value=event.expert(event_id),
                                                                               style={'margin-top': '20px'})
                                                                 ], id='layout-content'),
                                                                 html.Button(type='submit',
                                                                             children='Submit',
                                                                             className='btn btn-primary',
                                                                             id='submit',
                                                                             style={'margin-top': '70px'})
                                                             ])
                                                ])
                                  ])
                     ])
    # inner = html.Div(className='row',
    #                  children=[
    #                      html.Div(className='col-6 grid-margin stretch-card',
    #                               children=[
    #                                   cards
    #                               ])
    #                  ])
    return cards


def description_layout(event_id=1):
    event = Event()
    cards = html.Div(className='card w-100',
                     children=[
                         html.Div(className='card-body',
                                  children=[
                                      html.H4(className='card-title', children='Event Manager Detail',
                                              style={'margin-left': '10px'}),
                                      html.P(className='card-description',
                                             style={'margin-bottom': '30px',
                                                    'margin-left': '10px'},
                                             children='The data below are the current values for this event.'),
                                      html.Div(className='text-muted font-weight-normal',
                                               style={'margin': '10px'},
                                               children='Event ID: ' + str(event_id)),
                                      # html.Div(className='text-muted font-weight-normal',
                                      #         style={'margin': '10px'},
                                      #         children='Date Created: ' + event.datetime(event_id)),
                                      html.Div(className='text-muted font-weight-normal',
                                               style={'margin': '10px'},
                                               children='Location: ' + event.location(event_id)),
                                      html.Div(className='text-muted font-weight-normal',
                                               style={'margin': '10px'},
                                               children='Status: ' + event.status(event_id)),
                                      html.Div(className='text-muted font-weight-normal',
                                               style={'margin': '10px'},
                                               children='Severity: ' + event.severity(event_id)),
                                      html.Div(className='text-muted font-weight-normal',
                                               style={'margin': '10px'},
                                               children='Comments: ' + event.comments(event_id)),
                                      html.Div(className='text-muted font-weight-normal',
                                               style={'margin': '10px'},
                                               children='Expert Remedy: ' + event.expert(event_id))
                                  ])
                     ])
    # inner = html.Div(className='row',
    #                  children=[
    #                      html.Div(className='col-6 grid-margin stretch-card',
    #                               children=[
    #                                   cards
    #                               ])
    #                  ])
    return cards


def overall_layout(event_id):
    cards = [form_layout(event_id),
             description_layout(event_id)]
    columns = [html.Div(className='col-5 grid-margin stretch-card',
                        style={'margin-left': '30px',
                               'margin-top': '30px',
                               'margin-right': '30px'},
                        children=each)
               for each in cards]
    inner = html.Div(children=[
        html.Div(className='row', children=columns)
    ])
    return inner


def calendar_layout():
    columns = list()
    for each in ('start_date', 'end_date'):
        columns.append(html.Div(className='col-xl-6 col-sm-6 grid-'
                                          'margin stretch-card',
                                children=[dcc.DatePickerSingle(id=each, style={'width': '100%'})]))
    inner = html.Div(children=[
        html.Div(className='row', children=columns)
    ])
    return inner


def kpi_cards_layout(kpi_cards):
    inner = html.Div(className='row',
                     children=[
                         html.Div(className='col-xl-3 col-sm-6 '
                                            'grid-margin '
                                            'stretch-card',
                                  children=x)
                         for x in kpi_cards
                     ])
    return inner


def nav_layout(user_name='Dustin Landers', title='Golgix Manufacturing Intelligence Platform'):
    inner = html.Div(className='main-panel',
                     style={'background': 'white',
                            'border': '0px'},
                     id='inner',
                     children=[
                         content_wrapper([
                             html.Iframe(src='http://' + SUPERSET_IP + ':8088/superset/dashboard/' +
                                             FAILURE_PREDICTOR_DASH_NUM + '?standalone=3&expand_filters=0',
                                         height='100%',
                                         width='100%')])
                     ])
    bar = html.Nav(className='navbar p-0 fixed-top d-flex flex-row',
                   id='bar',
                   children=[
                       html.Div(className='navbar-menu-wrapper flex-grow d-flex align-items-stretch',
                                children=[
                                    html.Button(className='navbar-toggler navbar-toggler align-self-center',
                                                id='activate',
                                                type='button',
                                                children=[
                                                    html.Span(className='mdi mdi-menu')
                                                ],
                                                **{'data-toggle': 'minimize'}),
                                    html.Button(className='navbar-toggler navbar-toggler-right d-lg-none '
                                                          'align-self-center',
                                                id='small-activate',
                                                type='button',
                                                children=[
                                                    html.Span(className='mdi mdi-format-line-spacing')
                                                ],
                                                **{'data-toggle': 'offcanvas'}),
                                    html.Ul(className='navbar-nav align-self-center',
                                            style={'width': '100%',
                                                   'display': 'inline-block'},
                                            children=[
                                                html.Li(className='nav-item',
                                                        style={'textAlign': 'center',
                                                               'verticalAlign': 'middle'},
                                                        children=title)
                                            ]),
                                    html.Ul(className='navbar-nav navbar-nav-right',
                                            children=[
                                                html.Li(className='nav-item dropdown',
                                                        children=[
                                                            html.A(className='nav-link show',
                                                                   id='profileDropdown',
                                                                   children=[
                                                                       html.Div(className='navbar-profile',
                                                                                children=[
                                                                                    html.P(className='mb-0 d-none '
                                                                                                     'd-sm-block '
                                                                                                     'navbar-profile'
                                                                                                     '-name',
                                                                                           id='user_name',
                                                                                           children=[
                                                                                               'Log out'
                                                                                           ]),
                                                                                    html.I(className='mdi mdi-menu'
                                                                                                     '-down d-none '
                                                                                                     'd-sm-block',
                                                                                           id='profile_arrow')
                                                                                ])
                                                                   ],
                                                                   **{'data-bg-toggle': 'dropdown',
                                                                      'aria-expanded': 'true'}),
                                                            html.Div(className='dropdown-menu dropdown-menu-right '
                                                                               'navbar-dropdown preview-list show',
                                                                     id='profile_dropdown',
                                                                     children=[
                                                                         html.H6(className='p-3 mb-0 align-self-center',
                                                                                 children=[
                                                                                     html.A(children=[
                                                                                         html.Button(className='btn '
                                                                                                               'btn'
                                                                                                               '-outline'
                                                                                                               '-danger',
                                                                                                     children="Log out",
                                                                                                     style={
                                                                                                         'width': '100%',
                                                                                                         'display': 'inline-block'},
                                                                                                     id='logout')
                                                                                     ],
                                                                                         target="_parent",
                                                                                         href="http://" + SUPERSET_IP + ":8088/logout")
                                                                                 ])
                                                                     ],
                                                                     **{'aria-labelledby': 'profileDropdown',
                                                                        'data-bs-popper': 'none'})
                                                        ])
                                            ])
                                ])
                   ])
    nav = html.Div(className='sidebar sidebar-offcanvas',
                   id='sidebar',
                   children=[
                       html.Div(className='sidebar-brand-wrapper d-none d-lg-flex align-items-center '
                                          'justify-content-center fixed-top',
                                children=[
                                    html.A(className='sidebar-brand brand-logo',
                                           children=html.Img(src='assets/images/logo.png')),
                                    html.A(className='sidebar-brand brand-logo-mini',
                                           children=html.Img(src='assets/images/logo-mini.png'))
                                ]),
                       html.Ul(className='nav',
                               children=[
                                   html.Li(className='nav-item nav-category',
                                           children=[
                                               html.Span(className='nav-link',
                                                         children='Navigation')
                                           ]),
                                   html.Li(className='nav-item menu-items',
                                           id='item2',
                                           children=[
                                               html.A(className='nav-link',
                                                      children=[
                                                          html.Span(className='menu-icon', children=[
                                                              html.I(className='mdi mdi-speedometer')
                                                          ]),
                                                          html.Span(className='menu-title',
                                                                    children='Early Failure Predictor')
                                                      ])
                                           ]),
                                   html.Li(className='nav-item menu-items',
                                           id='item4',
                                           children=[
                                               html.A(className='nav-link',
                                                      children=[
                                                          html.Span(className='menu-icon', children=[
                                                              html.I(className='mdi mdi-speedometer')
                                                          ]),
                                                          html.Span(className='menu-title',
                                                                    children='Event Manager')
                                                      ])
                                           ]),
                                   html.Li(className='nav-item menu-items',
                                           id='item1',
                                           children=[
                                               html.A(className='nav-link',
                                                      children=[
                                                          html.Span(className='menu-icon', children=[
                                                              html.I(className='mdi mdi-speedometer')
                                                          ]),
                                                          html.Span(className='menu-title',
                                                                    children='Performance Tracker')
                                                      ])
                                           ])
                               ])
                   ])
    grid = html.Div(className='container-scroller sidebar-icon-only',
                    id='activated',
                    children=[
                        nav,
                        html.Div(className='container-fluid page-body-wrapper w-100 h-100',
                                 children=[
                                     bar,
                                     inner
                                 ])
                    ])
    return grid
