From: Chris Wright <chrisw@osdl.org>
Subject: Re: Using fs views to isolate untrusted processes: I need an assistant architect in the USA for Phase I of a DARPA funded linux kernel project
Date: Wed, 25 Aug 2004 18:06:15 -0700
Message-ID: <20040825180615.Z1973@build.pdx.osdl.net>
References: <410D96DC.1060405@namesys.com> <Pine.LNX.4.44.0408251624540.5145-100000@chimarrao.boston.redhat.com> <20040825205618.GA7992@hockin.org> <30958D95-F6ED-11D8-A7C9-000393ACC76E@mac.com> <412D2BD2.2090408@sun.com> <EAB989A6-F6F9-11D8-A7C9-000393ACC76E@mac.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20559-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <EAB989A6-F6F9-11D8-A7C9-000393ACC76E@mac.com>; from mrmacman_g4@mac.com on Wed, Aug 25, 2004 at 08:50:25PM -0400
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kyle Moffett <mrmacman_g4@mac.com>
Cc: Mike Waychison <Michael.Waychison@Sun.COM>, LKML <linux-kernel@vger.kernel.org>, Rik van Riel <riel@redhat.com>, Tim Hockin <thockin@hockin.org>, ReiserFS List <reiserfs-list@namesys.com>, Hans Reiser <reiser@namesys.com>

* Kyle Moffett (mrmacman_g4@mac.com) wrote:
> I would find this much more useful if there was a really lightweight 
> bind
> mount called a "filebind" or somesuch that could only bindmount files 

This already works.

# cd /tmp
# echo foo > a
# touch b
# mount --bind a b
# cat b
foo

thanks,
-chris
-- 
Linux Security Modules     http://lsm.immunix.org     http://lsm.bkbits.net
