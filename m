From: Kris Van Bruwaene <kris.vanbruwaene@vrt.be>
Subject: Compile problem with reiser4progs
Date: Thu, 08 Jan 2004 13:11:30 +0100
Message-ID: <3FFD48F2.5050306@vrt.be>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16437-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hi

I installed and patched kernel 2.6.0 exactly as described in the 
procedure on the site (install_v4.html), compiled libaal and configured 
reiser4progs (both without any options), and when 'make'ing reiser4progs 
I got the following error messages:
libaal.c:13 multiple definition of 'libreiser4_max_interface_version'
reiseprogs-0.4.20/libreiser4/libreiser4.c:242: first defined here
collect 2: ld returned 1 exit status

I'm using gcc 3.2.3


