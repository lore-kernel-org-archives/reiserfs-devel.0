From: Bryan Henderson <hbryan@us.ibm.com>
Subject: RE: [benchmark] seek optimization
Date: Wed, 14 Jul 2004 13:11:39 -0700
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <OF5CD40530.F971AA8A-ON85256ED1.006E4E3B-88256ED1.006EE609@us.ibm.com>
References: <Pine.LNX.4.21.0407141939400.5378-100000@mlf.linux.rulez.org>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.21.0407141939400.5378-100000@mlf.linux.rulez.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Szakacsits Szabolcs <szaka@sienet.hu>
Cc: Guy <bugzilla@watkins-home.com>, linux-fsdevel@vger.kernel.org, linux-fsdevel-owner@vger.kernel.org, 'Marcel Hilzinger' <mhilzinger@linuxnewmedia.de>, 'Per Olofsson' <pelle@dsv.su.se>, reiserfs-list@namesys.com

>> It would also be nice to have no destination disk at all, to isolate 
the 
>> effects of seek optimization in the source filesystem.
>
>The mentioned theoretical best values had seeks neither in the source nor
>in the destination. Sorry I forgot to explain.

Not sure how that relates to my point.  I'm saying that in the actual 
experiment -- nothing theoretical -- if you're copying a file from source 
to destination and watching how long it takes, you're seeing both how long 
it takes to read and how long it takes to write (not to mention the ugly 
interaction between the two if they're behind the same head and being done 
by a single process).  A simpler experiment where you copy a file from a 
filesystem into oblivion would eliminate any seeks or other delays on the 
write side and any interaction between the two and leave just the seeks on 
the read side to measure.

And that information seems like it would be more useful.  Many 
applications simply read and use data; they don't copy it into another 
file -- especially one that uses the same resources as the source file.

