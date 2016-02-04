      block data fisdata
c
c +---------------------------------------------------------------------
c | Author: Marieke Duijvestijn
c | Date  : September 1, 2004
c | Task  : Fit parameter values for reconstruction of fission barriers
c +---------------------------------------------------------------------
c
c ****************** Declarations and common blocks ********************
c
      include "talys.cmb"
c
c barcof: parameter values for barrier heights at l=0
c l20cof: parameter values for l20 belonging to 20% barrier height
c l80cof: parameter values for l80 belonging to 80% barrier height
c lmxcof: parameter values for lmax, l-value where barrier disappears
c egscof: parameter values for rotating ground state energy
c
      data barcof
     + /5.11819909e+5,-1.30303186e+6, 1.90119870e+6,-1.20628242e+6,
     +  5.68208488e+5, 5.48346483e+4,-2.45883052e+4,
     + -1.13269453e+6, 2.97764590e+6,-4.54326326e+6, 3.00464870e+6,
     + -1.44989274e+6,-1.02026610e+5, 6.27959815e+4,
     +  1.37543304e+6,-3.65808988e+6, 5.47798999e+6,-3.78109283e+6,
     +  1.84131765e+6,  1.53669695e+4,-6.96817834e+4,
     + -8.56559835e+5, 2.48872266e+6,-4.07349128e+6, 3.12835899e+6,
     + -1.62394090e+6, 1.19797378e+5, 4.25737058e+4,
     +  3.28723311e+5,-1.09892175e+6, 2.03997269e+6,-1.77185718e+6,
     +  9.96051545e+5,-1.53305699e+5,-1.12982954e+4,
     +  4.15850238e+4, 7.29653408e+4,-4.93776346e+5, 6.01254680e+5,
     + -4.01308292e+5, 9.65968391e+4,-3.49596027e+3,
     + -1.82751044e+5, 3.91386300e+5,-3.03639248e+5, 1.15782417e+5,
     + -4.24399280e+3,-6.11477247e+3, 3.66982647e+2/
      data l20cof
     +/-9.01100e+2,-1.40818e+3, 2.77000e+3,-7.06695e+2, 8.89867e+2,
     +  1.35355e+4,-2.03847e+4, 1.09384e+4,-4.86297e+3,-6.18603e+2,
     + -3.26367e+3, 1.62447e+3,1.36856e+3, 1.31731e+3, 1.53372e+2,
     +  7.48863e+3,-1.21581e+4, 5.50281e+3,-1.33630e+3, 5.05367e-02/
      data l80cof
     + /1.84542e+3,-5.64002e+3,5.66730e+3,-3.15150e+3, 9.54160e+2,
     + -2.24577e+3, 8.56133e+3,-9.67348e+3, 5.81744e+3,-1.86997e+3,
     +  2.79772e+3,-8.73073e+3, 9.19706e+3,-4.91900e+3, 1.37283e+3,
     + -3.01866e+1, 1.41161e+3,-2.85919e+3, 2.13016e+3,-6.49072e+2/
      data lmxcof/
     +9.43596e4,-2.241997e5,2.223237e5,-1.324408e5,4.68922e4,-8.83568e3,
     +-1.655827e5,4.062365e5,-4.236128e5,2.66837e5,-9.93242e4,1.90644e4,
     + 1.705447e5,-4.032e5,3.970312e5,-2.313704e5,7.81147e4,-1.322775e4,
     +-9.274555e4,2.278093e5,-2.422225e5,1.55431e5,-5.78742e4,9.97505e3/
      data egscof
     +/1.927813e5, 7.666859e5, 6.628436e5, 1.586504e5,-7.786476e3,
     +-4.499687e5,-1.784644e6,-1.546968e6,-4.020658e5,-3.929522e3,
     + 4.667741e5, 1.849838e6, 1.641313e6, 5.229787e5, 5.928137e4,
     +-3.017927e5,-1.206483e6,-1.124685e6,-4.478641e5,-8.682323e4,
     + 1.226517e5, 5.015667e5, 5.032605e5, 2.404477e5, 5.603301e4,
     +-1.752824e4,-7.411621e4,-7.989019e4,-4.175486e4,-1.024194e4,
     +-6.459162e5,-2.903581e6,-3.048551e6,-1.004411e6,-6.558220e4,
     + 1.469853e6, 6.564615e6, 6.843078e6, 2.280839e6, 1.802023e5,
     +-1.435116e6,-6.322470e6,-6.531834e6,-2.298744e6,-2.639612e5,
     + 8.665296e5, 3.769159e6, 3.899685e6, 1.520520e6, 2.498728e5,
     +-3.302885e5,-1.429313e6,-1.512075e6,-6.744828e5,-1.398771e5,
     + 4.958167e4, 2.178202e5, 2.400617e5, 1.167815e5, 2.663901e4,
     + 3.117030e5, 1.195474e6, 9.036289e5, 6.876190e4,-6.814556e4,
     +-7.394913e5,-2.826468e6,-2.152757e6,-2.459553e5, 1.101414e5,
     + 7.918994e5, 3.030439e6, 2.412611e6, 5.228065e5, 8.542465e3,
     +-5.421004e5,-2.102672e6,-1.813959e6,-6.251700e5,-1.184348e5,
     + 2.370771e5, 9.459043e5, 9.026235e5, 4.116799e5, 1.001348e5,
     +-4.227664e4,-1.738756e5,-1.795906e5,-9.292141e4,-2.397528e4,
     +-1.072763e5,-5.973532e5,-6.151814e5, 7.371898e4, 1.255490e5,
     + 2.298769e5, 1.265001e6, 1.252798e6,-2.306276e5,-2.845824e5,
     +-2.093664e5,-1.100874e6,-1.009313e6, 2.705945e5, 2.506562e5,
     + 1.274613e5, 6.190307e5, 5.262822e5,-1.336039e5,-1.115865e5,
     +-5.715764e4,-2.560989e5,-2.228781e5,-3.222789e3, 1.575670e4,
     + 1.189447e4 , 5.161815e4, 4.870290e4, 1.266808e4, 2.069603e3/
c
c x1b,x1h,x2b,x2h,x3b,x3h: parameter values for RLDM barrier heights
c
      data x1b/.28,.243,.221,.208,.195,.18,.211,.186,.17,.1506,.136,.12,
     +.152,.131,.1155,.096,.0795,.0625,.09725,.0795,.065,.0506,.0375,.02
     +53,.05771,.0455,.03414,.0235,.014,.0065,.03325,.0235,.0153,.0081,.
     +001,.0,.01625,.009,.0032,.0,.0,.0,.0071,.0,.0,.0,.0,.0,.0,.0,.0,.0
     +,.0,.0,.0,.0,.0,.0,.0,.0,0.,0.,0.,0.,0.,0./
      data x1h/.0,.0,.0,.0,.0,.0,-.0057,-.0058,-.006,-.0061,-.0062,-.006
     +3,-.0193,-.0203,-.0211,-.022,-.023,-.0245,-.0402,-.0427,-.0456,-.0
     +497,-.054,-.0616,-.0755,-.0812,-.0899,-.0988,-.109,-.12,-.1273,-.1
     +356,-.147,-.1592,-.1745,-.1897,-.1755,-.1986,-.2128,-.2296,-.251,-
     +.26,-.255,-.271,-.291,-.301,-.327,-.335,-.354,-.36,-.365,-.372,-.4
     +03,-.42,-.35,-.35,-.35,-.35,-.35,-.35,-.35,-.35,-.35,-.35,-.35,
     +-.35/
      data x2b/.18,.1695,.1515,.133,.1155,.0949,.1495,.1363,.1165,.099,.
     +0815,.0594,.12,.1032,.0864,.0678,.0469,.028,.09,.0725,.0556,.037,.
     +019,.0057,.0625,.045,.0304,.016,.005,0.,.0406,.0264,.0151,.0052,0.
     +,0.,.0253,.0144,.0027,0.,0.,0.,.0141,.006,0.,0.,0.,0.,.0065,.0008,
     +0.,0.,0.,0.,.002,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0./
      data x2h/0.,0.,0.,0.,0.,0.,-.0018,-.0019,-.00215,-.0024,-.0025,-.0
     +03,-.0063,-.00705,-.0076,-.0083,-.0091,-.0095,-.015,-.0158,-.0166,
     +-.0192,-.0217,-.025,-.0245,-.0254,-.029,-.0351,-.0478,-.0613,-.038
     + 7,-.0438,-.0532,-.0622,-.0845,-.0962,-.0616,-.0717,-.0821,-.0972,
     +-.1123,-.1274,-.0793,-.1014,-.1138,-.1262,-.1394,-.1526,-.12,-.134
     +,-.1503,-.1666,-.1829,-.1992,-.1528,-.171,-.1907,-.2104,-.2301,-.2
     +498,-.23,-.23,-.23,-.23,-.23,-.23/
      data x3h/0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,-.00012,-.00014,-.00016,-.0
     +0018,-.0002,-.00024,-.00029,-.00036,-.00065,-.00089,-.00047,-.0005
     +,-.00058,-.00065,-.00074,-.00085,-.00101,-.00124,-.00138,-.00178,-
     +.001,-.00105,-.00124,-.00138,-.00156,-.00179,-.00275,-.00292,-.003
     +,-.003,-.00176,-.0019,-.00211,-.00235,-.00263,-.00298,-.00449,-.00
     +53,-.0053,-.0053,-.003,-.00308,-.00318,-.00352,-.00392,-.00417,-.0
     +062,-.0062,-.0062,-.0062,-.00374,-.0041,-.00444,-.00488,-.00521,-.
     +00545,-.0066,-.0066,-.0066,-.0066,-.0053,-.0055,-.00585,-.0064,-.0
     +0695,-.007,-.007,-.007,-.007,-.007,-.00632,-.007,-.00742,-.00792,-
     +.00856,-.009,-.009,-.009,-.009,-.009,-.0079,-.0085,-.01022,-.0119,
     +-.012,-.012,-.012,-.012,-.012,-.012,-.00944,-.0102,-.0142,-.0182,-
     +.019,-.019,-.019,-.019,-.019,-.019,-.0112,-.0133,-.0182,-.0238,-.0
     +24,-.024,-.024,-.024,-.024,-.024,-.01303,-.0178,-.0226,-.0274,-.02
     +8,-.028,-.028,-.028,-.028,-.028,-.0165,-.0254,-.0343,-.0343,-.034,
     +-.034,-.034,-.034,-.034,-.034,-.0203,-.033,-.04,-.04,-.04,-.04,-.0
     +4,-.04,-.04,-.04,-.025,-.0406,-.046,-.047,-.047,-.047,-.047,-.047,
     +-.047,-.047,-.03036,-.0482,-.048,-.048,-.048,-.048,-.048,-.048,-.0
     +48,-.048,-.0363,-.0558,-.056,-.056,-.056,-.056,-.056,-.056,-.056,-
     +.056,-.04234,-.0634,-.064,-.064,-.064,-.064,-.064,-.064,-.064,-.06
     +4,-.064,-.064,-.064,-.064,-.064,-.064,-.064,-.064,-.064,-.064/
      data x3b/.0949,.0755,.0564,.0382,.0223,.0121,.00588,.00242,.00069,
     +.0001,.0873,.0684,.049,.0306,.0162,.0074,.00267,.00055,0.,0.,.0801
     +,.061,.0418,.0235,.0108,.00373,.00071,0.,0.,0.,.073,.054,.035,.017
     +8,.0062,.00125,0.,0.,0.,0.,.0661,.047,.0284,.012,.0025,0.,0.,0.,0.
     +,0.,.0594,.0404,.022,.0065,0.,0.,0.,0.,0.,0.,.0528,.034,.0159,.002
     +,0.,0.,0.,0.,0.,0.,.0465,.0277,.01,0.,0.,0.,0.,0.,0.,0.,.0401,.021
     +7,.0044,0.,0.,0.,0.,0.,0.,0.,.0339,.0158,.00024,0.,0.,0.,0.,0.,0.,
     +0.,.028,.0106,0.,0.,0.,0.,0.,0.,0.,0.,.0219,.0064,0.,0.,0.,0.,0.,0
     +.,0.,0.,.0164,.0025,0.,0.,0.,0.,0.,0.,0.,0.,.0122,0.,0.,0.,0.,0.,0
     +.,0.,0.,0.,.0085,0.,0.,0.,0.,0.,0.,0.,0.,0.,.0057,0.,0.,0.,0.,0.,0
     +.,0.,0.,0.,.0035,0.,0.,0.,0.,0.,0.,0.,0.,0.,.0016,0.,0.,0.,0.,0.,0
     +.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0
     +.,0./
      end
Copyright (C)  2013 A.J. Koning, S. Hilaire and S. Goriely
