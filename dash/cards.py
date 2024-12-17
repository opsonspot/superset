from dash import html


def kpi_card(value: str, delta: str, name: str, direction: str, value_tag='abc', delta_tag='def', arrow_tag='ghi'):

    if direction not in ('success', 'danger'):
        raise ValueError('direction argument must be success or danger')

    arrow_direction = {'success': 'top',
                       'danger': 'bottom'}[direction]

    inner_card_a = html.Div(className='col-9', children=[
        html.Div(className='d-flex align-items-center align-self-start',
                 children=[
                     html.H3(className='mb-0',
                             children=value,
                             id=value_tag),
                     html.P(className='text-{} ms-2 mb-0 font-weight-medium'.format(direction),
                            children=delta,
                            id=delta_tag)
                 ])
    ])

    inner_card_b = html.Div(className='col-3', children=[
        html.Div(className='icon icon-box-{}'.format(direction),
                 children=[
                     html.Span(className='mdi mdi-arrow-{}-right icon-item'.format(arrow_direction),
                               id=arrow_tag)
                 ])
    ])

    inner_cards = [inner_card_a, inner_card_b]

    cards = html.Div(className='card',
                     children=[html.Div(className='card-body',
                                        children=[
                                            html.Div(className='row',
                                                     children=inner_cards),
                                            html.H6(className='text-muted font-weight-normal',
                                                    children=name)
                                        ])])

    return cards
