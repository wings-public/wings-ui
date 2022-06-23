using Accord.Statistics.Analysis;
using Accord.Statistics.Testing;
using System;

namespace WebGAP.Statistics
{
    public class FisherTest
    {
        private double _pVal;

        public FisherTest(ConfusionMatrix matrix)
        {

            //var fet = new FisherExactTest(matrix, alternate: OneSampleHypothesis.ValueIsDifferentFromHypothesis);
            
            //double p = fet.PValue;
            //bool significant = fet.Significant; // should be true

            ////_pVal = ((double)((int)(p * 1000.0))) / 1000.0;
            //_pVal = (p<1 ? ((double)((int)(p * 100000.0))) / 100000.0 : 1.000);


        }       

        public double PValueToReturn
        {
            get
            {
                return _pVal;
            }
        }

    }
}