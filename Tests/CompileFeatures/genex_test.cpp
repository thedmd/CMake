
#if !HAVE_OVERRIDE_CONTROL
#if EXPECT_OVERRIDE_CONTROL
#error "Expect override control feature"
#endif
#else

struct A
{
  virtual int getA() { return 7; }
};

struct B : A
{
  int getA() override { return 42; }
};

#endif

#if !HAVE_NULLPTR
#error "Expect nullptr feature"
#else

#if !HAVE_THREAD_LOCAL
#  if EXPECT_THREAD_LOCAL
#    error Expect cxx_thread_local support
#  endif
#else
#  if !EXPECT_THREAD_LOCAL
#    error Expect no cxx_thread_local support
#  endif
#endif

#if !HAVE_FINAL
#  if EXPECT_FINAL
#    error Expect cxx_final support
#  endif
#else
#  if !EXPECT_FINAL
#    error Expect no cxx_final support
#  endif
#endif

#if !HAVE_THREAD_LOCAL_AND_FINAL
#  if EXPECT_THREAD_LOCAL_AND_FINAL
#    error Expect cxx_thread_local and cxx_final support
#  endif
#else
#  if !EXPECT_THREAD_LOCAL_AND_FINAL
#    error Expect no combined cxx_thread_local and cxx_final support
#  endif
#endif

const char* getString()
{
  return nullptr;
}

#endif

int main()
{

}
