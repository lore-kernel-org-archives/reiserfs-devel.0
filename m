From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: reiser4 data journalling?
Date: Thu, 28 Aug 2003 21:42:34 +0400
Message-ID: <16206.16138.72832.920045@laputa.namesys.com>
References: <3F4E3AF9.2060100@tupshin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15477-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F4E3AF9.2060100@tupshin.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tupshin Harper <tupshin@tupshin.com>
Cc: Reiserfs List <reiserfs-list@namesys.com>

Tupshin Harper writes:
 > Will reiser4 have options equivalent to ext3's data=journal and 
 > data=ordered options? My understanding is that reiser4(and reiser3) do 
 > the equivalent of ext3's writeback mode(correct?). Any plans for the 

reiserfs has meta-data only journalling by default (equivalent to
writeback mode), and optionally supports full data journalling (Chris
patches).

reiser4 supports full data journalling only, but it is still faster than
ext3-writeback.

Look at http://www.namesys.com/benchmarks.html for last benchmarking
results.

 > other modes in order to maximize data integrity?
 > 
 > -Tupshin
 > 

Nikita.
