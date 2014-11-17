
#if DEFAULT_CXX14
#  if __cplusplus != 201402L
#    error Unexpected value for __cplusplus.
#  endif
#elif DEFAULT_CXX11
#  if __cplusplus != 201103L
#    error Unexpected value for __cplusplus.
#  endif
#else
#  if !DEFAULT_CXX98
#    error Buildsystem error
#  endif
#  if __cplusplus != 199711L
#    error Unexpected __cplusplus value
#  endif
#endif

int main()
{
  return 0;
}
