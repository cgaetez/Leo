rails generate model User                                  \
    document_id:string                                     \
    first_name:string                                      \
    last_name:string                                       \
    date_of_birth:date                                     \
    picture:string                                         \
    background:string                                      \
    status:string                                          ;

rails generate model Friendship                            \
    user:references                                        \
    friend:references                                      \
    relationship:string                                    \
    status:string                                          ;

rails generate model School                                \
    name:string                                            \
    address:text                                           \
    latitude:float                                         \
    longitude:float                                        \
    url:string                                             \
    picture:string                                         \
    status:string                                          ;

rails generate model Employee                              \
    user:references                                        \
    school:references                                      \
    relationship:string                                    \
    status:string                                          ;

rails generate model Course   generate-> scaffold_controller -> terminal                                \
    school:references                                      \
    name:string                                            \
    level:string                                           \
    year:string                                            \
    status:string                                          ;

rails generate model Subscription                          \
    user:references                                        \
    course:references                                      \
    relationship:string                                    \
    status:string                                          ;

rails generate model Homework                              \
    teacher:references                                     \
    course:references                                      \
    activity:string                                        \
    title:string                                           \
    content:text                                           \
    status:string                                          ;

rails generate model Page                                  \
    homework:references                                    \
    title:string                                           \
    content:text                                           \
    status:string                                          ;

rails generate model Assignment                            \
    teacher:references                                     \
    student:references                                     \
    homework:references                                    \
    score:integer                                          \
    status:string                                          ;

rails generate model Answer                                \
    student:references                                     \
    homework:references                                    \
    page:references                                        \
    content:text                                           \
    status:string                                          ;

rails generate model Comment                               \
    student:references                                     \
    homework:references                                    \
    page:references                                        \
    start_at_character:integer                             \
    ends_at_character:integer                              \
    content:text                                           \
    status:string                                          ;
