/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_IBEX_HOME_ALEN_IBEX_LIB_BUILD_SRC_PARSER_PARSER_TAB_HH_INCLUDED
# define YY_IBEX_HOME_ALEN_IBEX_LIB_BUILD_SRC_PARSER_PARSER_TAB_HH_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int ibexdebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    TK_CHOCO = 258,
    TK_CONSTANT = 259,
    TK_NEW_SYMBOL = 260,
    TK_FUNC_SYMBOL = 261,
    TK_EXPR_TMP_SYMBOL = 262,
    TK_ENTITY = 263,
    TK_ITERATOR = 264,
    TK_UNARY_OP = 265,
    TK_BINARY_OP = 266,
    TK_STRING = 267,
    TK_INT_CST = 268,
    TK_FLOAT = 269,
    TK_PI = 270,
    TK_INFINITY = 271,
    TK_BOOL = 272,
    TK_PARAM = 273,
    TK_CONST = 274,
    TK_VARS = 275,
    TK_FUNCTION = 276,
    TK_DIFF = 277,
    TK_MIN = 278,
    TK_MAX = 279,
    TK_INF = 280,
    TK_MID = 281,
    TK_SUP = 282,
    TK_SIGN = 283,
    TK_ABS = 284,
    TK_SUM = 285,
    TK_SQRT = 286,
    TK_SQR = 287,
    TK_POW = 288,
    TK_EXPO = 289,
    TK_LOG = 290,
    TK_COS = 291,
    TK_SIN = 292,
    TK_TAN = 293,
    TK_ACOS = 294,
    TK_ASIN = 295,
    TK_ATAN = 296,
    TK_ATAN2 = 297,
    TK_COSH = 298,
    TK_SINH = 299,
    TK_TANH = 300,
    TK_ACOSH = 301,
    TK_ASINH = 302,
    TK_ATANH = 303,
    TK_FLOOR = 304,
    TK_CEIL = 305,
    TK_INTEGER = 306,
    TK_LEQ = 307,
    TK_GEQ = 308,
    TK_EQU = 309,
    TK_ASSIGN = 310,
    TK_CHI = 311,
    TK_BEGIN = 312,
    TK_END = 313,
    TK_FOR = 314,
    TK_FROM = 315,
    TK_TO = 316,
    TK_RETURN = 317,
    TK_CTRS = 318,
    TK_MINIMIZE = 319,
    TK_IN = 320,
    TK_UNION = 321,
    TK_INTERSEC = 322
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 20 "parser/parser.yc" /* yacc.c:1909  */

  char*     str;
  int       itg;
  double    real;
  
  ibex::Interval* itv;
  
  ibex::Dim*      dim;
  
  ibex::parser::P_NumConstraint*                constraint;
  std::vector<ibex::parser::P_NumConstraint*>*  constraints;

  const ibex::parser::P_ExprNode*               expression;
  std::vector<const ibex::parser::P_ExprNode*>* expressions;


#line 139 "/home/alen/ibex-lib/build/src/parser/parser.tab.hh" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE ibexlval;

int ibexparse (void);

#endif /* !YY_IBEX_HOME_ALEN_IBEX_LIB_BUILD_SRC_PARSER_PARSER_TAB_HH_INCLUDED  */
