From: jordan.breeding@attbi.com
Subject: [RFC] [PATCH] Label support in mount
Date: Thu, 29 Aug 2002 05:20:41 +0000
Message-ID: <20020829052041.GDJC14185.rwcrmhc51.attbi.com@rwcrwbc58>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="NextPart_Webmail_9m3u9jl4l_18468_1030598441"
Return-path: <reiserfs-list-return-11337-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--NextPart_Webmail_9m3u9jl4l_18468_1030598441
Content-Type: text/plain
Content-Transfer-Encoding: 8bit

Hello,

  This patch was originally intended to try and add
support for reiserfs labels to mount from
util-linux-2.11u found on ftp.kernel.org.  It is not
quite working (if I try to mount something by label the
mount program seg. faults), and I won't have time to
debug and look at it until at least tomorrow night.  I am
sure there is something trivial or stupid that I have
done wrong.  At least it is a starting point, if someone
knows what is wrong and knows how to fix it quickly then
feel free to fix the patch and send it back to me or send
it to the util-linux maintainer.

Jordan Breeding

--NextPart_Webmail_9m3u9jl4l_18468_1030598441--
