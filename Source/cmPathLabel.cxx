/*============================================================================
  CMake - Cross Platform Makefile Generator
  Copyright 2000-2009 Kitware, Inc., Insight Software Consortium

  Distributed under the OSI-approved BSD License (the "License");
  see accompanying file Copyright.txt for details.

  This software is distributed WITHOUT ANY WARRANTY; without even the
  implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
  See the License for more information.
============================================================================*/

#include "cmPathLabel.h"

//----------------------------------------------------------------------------
cmPathLabel::cmPathLabel(const std::string& label)
: Label(label), Hash(0)
{
  for(size_t i = 0; i < this->Label.size(); ++i)
    {
    this->Hash += this->Label[i];
    this->Hash += (this->Hash << 10);
    this->Hash ^= (this->Hash >> 6);
    }
  this->Hash += (this->Hash << 3);
  this->Hash ^= (this->Hash >> 11);
  this->Hash += (this->Hash << 15);
}

//----------------------------------------------------------------------------
bool cmPathLabel::operator < (const cmPathLabel& l) const
{
  return this->Hash < l.Hash;
}

//----------------------------------------------------------------------------
bool cmPathLabel::operator == (const cmPathLabel& l) const
{
  return this->Hash == l.Hash;
}
