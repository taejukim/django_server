# Test 에 필요한 참조 Data

status_code = {'100': 'Continue',
 '101': 'Switching Protocols',
 '102': 'Processing',
 '103': 'Early Hints',
 '200': 'OK',
 '201': 'Created',
 '202': 'Accepted',
 '203': 'Non-Authoritative Information',
 '204': 'No Content',
 '205': 'Reset Content',
 '206': 'Partial Content',
 '207': 'Multi-Status',
 '208': 'Multi-Status',
 '226': 'IM Used',
 '300': 'Multiple Choices',
 '301': 'Moved Permanently',
 '302': 'Found',
 '303': 'See Other',
 '304': 'Not Modified',
 '305': 'Use Proxy',
 '306': 'unused',
 '307': 'Temporary Redirect',
 '308': 'Permanent Redirect',
 '400': 'Bad Request',
 '401': 'Unauthorized',
 '402': 'Payment Required',
 '403': 'Forbidden',
 '404': 'Not Found',
 '405': 'Method Not Allowed',
 '406': 'Not Acceptable',
 '407': 'Proxy Authentication Required',
 '408': 'Request Timeout',
 '409': 'Conflict',
 '410': 'Gone',
 '411': 'Length Required',
 '412': 'Precondition Failed',
 '413': 'Payload Too Large',
 '414': 'URI Too Long',
 '415': 'Unsupported Media Type',
 '416': 'Range Not Satisfiable',
 '417': 'Expectation Failed',
 '418': "I'm a teapot",
 '421': 'Misdirected Request',
 '422': 'Unprocessable Entity',
 '423': 'Locked',
 '424': 'Failed Dependency',
 '426': 'Upgrade Required',
 '428': 'Precondition Required',
 '429': 'Too Many Requests',
 '431': 'Request Header Fields Too Large',
 '451': 'Unavailable For Legal Reasons',
 '500': 'Internal Server Error',
 '501': 'Not Implemented',
 '502': 'Bad Gateway',
 '503': 'Service Unavailable',
 '504': 'Gateway Timeout',
 '505': 'HTTP Version Not Supported',
 '506': 'Variant Also Negotiates',
 '507': 'Insufficient Storage',
 '508': 'Loop Detected',
 '510': 'Not Extended',
 '511': 'Network Authentication Required',
 '425': 'Too Early'}

html = '''
<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
</head>
<body>
   <img src="https://www.nhn.com/renewal/img/logo.png"/>
   <h1>HTML Ipsum Presents</h1>
   <p><strong>Pellentesque habitant morbi tristique</strong> senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. <em>Aenean ultricies mi vitae est.</em> Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum sed, <code>commodo vitae</code>, ornare sit amet, wisi. Aenean fermentum, elit eget tincidunt condimentum, eros ipsum rutrum orci, sagittis tempus lacus enim ac dui. <a href="#">Donec non enim</a> in turpis pulvinar facilisis. Ut felis.</p>
   <h2>Header Level 2</h2>
   <ol>
      <li>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</li>
      <li>Aliquam tincidunt mauris eu risus.</li>
   </ol>

   <blockquote><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus magna. Cras in mi at felis aliquet congue. Ut a est eget ligula molestie gravida. Curabitur massa. Donec eleifend, libero at sagittis mollis, tellus est malesuada tellus, at luctus turpis elit sit amet quam. Vivamus pretium ornare est.</p></blockquote>

   <h3>Header Level 3</h3>

   <ul>
      <li>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</li>
      <li>Aliquam tincidunt mauris eu risus.</li>
   </ul>
   <span>Test Time : {}</span>
</body>
</html>
'''
