From: Sander <sander@humilis.net>
Subject: Re: Reiser4 problems on gentoo & 2.6.14-rc1-mm1
Date: Wed, 12 Oct 2005 15:17:07 +0200
Message-ID: <20051012131707.GA20657@favonius>
References: <200510121243.55956.ax@natur.cuni.cz> <434CF0B9.7030406@namesys.com> <200510121454.00672.ax@natur.cuni.cz>
Reply-To: sander@humilis.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-26510-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200510121454.00672.ax@natur.cuni.cz>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: V?clav H?la <ax@natur.cuni.cz>
Cc: reiserfs-list@namesys.com

V?clav H?la wrote (ao):
> Dne st?eda 12 ??jna 2005 13:17 Vladimir V. Saveliev napsal(a):
> > I believe it is fixed in 2.6.14-rc2-mm2. Please use it.
> >
> > PS: if it still does not work - try to set REISER4_USE_EFLUSH macro (it is
> > in file fs/reiser4/reiser4.h) to 1.
> > If that does not help - please report.
> 
> But I cannot compile 2.6.14-rc2-mm2:
 
This patch works for me:

http://marc.theaimsgroup.com/?l=reiserfs&m=112806903501734&w=4

-- 
Humilis IT Services and Solutions
http://www.humilis.net
