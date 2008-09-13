From: =?ISO-8859-1?Q?Bo_Brant=E9n?= <bosse@acc.umu.se>
Subject: Question on how file tails are stored
Date: Sat, 13 Sep 2008 13:10:39 +0200 (CEST)
Message-ID: <Pine.A41.4.64.0809131302350.548908@stalin.acc.umu.se>
References: <Pine.A41.4.64.0809100203340.884914@stalin.acc.umu.se>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <Pine.A41.4.64.0809100203340.884914@stalin.acc.umu.se>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org


Hello,

I would like to ask you how file tails are stored on ReiserFs 3.6, am I 
right that they are stored as either one or two items but not more than 
two?

Also I found this statement on the Internet:

"If a tail is larger than the maximum size of a file that can fit into a 
formatted node but is smaller than the unformatted node size (4K), then it 
is stored in an unformatted node, and a pointer to it plus a count of the 
space used is stored in an indirect item."

Does this represent a third case not covered of what I said above, and if 
so how does one detect this case and find the tail data?

Bo Branten

