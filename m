From: berthiaume_wayne@emc.com
Subject: --rebuild-sb
Date: Fri, 30 Aug 2002 16:49:31 -0400
Message-ID: <93F527C91A6ED411AFE10050040665D0049BFF3D@corpusmx1.us.dg.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----_=_NextPart_000_01C25066.BD413A10"
Return-path: <reiserfs-list-return-11352-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: vitaly@namesys.com, reiserfs-list@namesys.com

------_=_NextPart_000_01C25066.BD413A10
Content-Type: text/plain;
	charset="iso-8859-1"

	Helllo Vitaly. Going through the reiserfsck manpage I see exit codes
that tell me to use --fix-fixable and --rebuild-tree; however, I can't seem
to find anything for --rebuild-sb. Outside of parsing stdout, is there
another way to determine from an undocumented exit code the need for
--rebuild-sb? 	While testing a double power failure scenario I was able to
corupt the superblock and I'd like to automate my recovery scripts. So far
we start with a reiserfsck -q --check /dev/<something> >> <some log file>
and based on the exit code run a --fix-fixable or --rebuild-tree next. Your
advice would be most appreciated.

Regards,
Wayne
EMC Corp
Centera Engineering
4400 Computer Drive
M/S F213
Westboro,  MA    01580

email:       Berthiaume_Wayne@emc.com
voice:       (508) 898-6564
pager:     (888) 769-4578  (numeric)
                8007208398.9801155@pagenet.net  (alpha)
fax:          (508) 898-6388

"One man can make a difference, and every man should try."  - JFK



------_=_NextPart_000_01C25066.BD413A10--
