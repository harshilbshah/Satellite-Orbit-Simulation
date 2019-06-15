include <stdio.h>
include <stdlib.h>
include <string.h>
include "matlab.h"
static double real_data[] = { 1, 2, 3, 4, 5, 6 };
static double cplx_data[] = { 7, 8, 9, 10, 11, 12 };
main()
{
%/* Create two matrices */
mxArray *mat0 = mxCreateDoubleMatrix(2, 3, mxREAL);
mxArray *mat1 = mxCreateDoubleMatrix(3, 2, mxCOMPLEX);
memcpy(mxGetPr(mat0), real_data, 6 * sizeof(double));
memcpy(mxGetPr(mat1), real_data, 6 * sizeof(double));
memcpy(mxGetPi(mat1), cplx_data, 6 * sizeof(double));
%/* Print the matrices */
mlfPrintMatrix(mat0);
mlfPrintMatrix(mat1);
%/* Free the matrices */
mxDestroyArray(mat0);
mxDestroyArray(mat1);
%return(EXIT_SUCCESS);
}