Admin.create_with(password: '123456', name: 'Admin').find_or_create_by!(email: 'admin@gmail.com')
Admin.create_with(password: 'murilo', name: 'Murilo').find_or_create_by!(email: 'murilo@gmail.com')
Admin.create_with(password: 'felipe', name: 'Felipe').find_or_create_by!(email: 'felipe@gmail.com')
