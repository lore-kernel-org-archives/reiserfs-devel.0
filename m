From: Christian Kujau <lists@nerdbynature.de>
Subject: 2.6.19-rc5-git4 benchmarks
Date: Tue, 21 Nov 2006 19:09:41 +0000 (GMT)
Message-ID: <Pine.LNX.4.64.0611211802570.6933@sheep.housecafe.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <jfs-discussion-bounces@lists.sourceforge.net>
List-Id: <reiserfs-devel.vger.kernel.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/jfs-discussion>, 
	<mailto:jfs-discussion-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum=jfs-discussion>
List-Post: <mailto:jfs-discussion@lists.sourceforge.net>
List-Help: <mailto:jfs-discussion-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/jfs-discussion>, 
	<mailto:jfs-discussion-request@lists.sourceforge.net?subject=subscribe>
Sender: jfs-discussion-bounces@lists.sourceforge.net
Errors-To: jfs-discussion-bounces@lists.sourceforge.net
To: ext3-users@redhat.com
Cc: reiserfs-list@namesys.com, jfs-discussion@lists.sourceforge.net, linux-crypto@nl.linux.org, xfs@oss.sgi.com

Apologies for the wide alias, but as it may interest serveral
fs groups, here it is:

In the everlasting search for the best fs for my shiny new disks, I
was interested in some numbers, here're the results:

http://nerdbynature.de/bench/amd64/2.6.19-rc5-git4/test-3/dm-crypt-3.html

details: http://nerdbynature.de/wp/?cat=4

(in short: ext3 pretty fast in all operations. then again, the numbers 
suggest that sometimes a crypto-fs is faster than withou crypto, eg.
'ext3_no-cipher' vs. 'ext3_aes-cbc-essiv:md5'...that's strange, no?)

Thanks,
Christian.
-- 
BOFH excuse #11:

magnetic interference from money/credit cards

-------------------------------------------------------------------------
Take Surveys. Earn Cash. Influence the Future of IT
Join SourceForge.net's Techsay panel and you'll get the chance to share your
opinions on IT & business topics through brief surveys - and earn cash
http://www.techsay.com/default.php?page=join.php&p=sourceforge&CID=DEVDEV
