From: Hans Reiser <reiser@namesys.com>
Subject: Re: Using fs views to isolate untrusted processes: I need an assistant
 architect in the USA for Phase I of a DARPA funded linux kernel project
Date: Thu, 26 Aug 2004 00:52:36 -0700
Message-ID: <412D96C4.3030302@namesys.com>
References: <410D96DC.1060405@namesys.com> <Pine.LNX.4.44.0408251624540.5145-100000@chimarrao.boston.redhat.com> <20040825205618.GA7992@hockin.org> <30958D95-F6ED-11D8-A7C9-000393ACC76E@mac.com> <412D2BD2.2090408@sun.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20578-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <412D2BD2.2090408@sun.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mike Waychison <Michael.Waychison@Sun.COM>
Cc: Kyle Moffett <mrmacman_g4@mac.com>, Tim Hockin <thockin@hockin.org>, LKML <linux-kernel@vger.kernel.org>, Rik van Riel <riel@redhat.com>, ReiserFS List <reiserfs-list@namesys.com>, George Beshers <gbeshers@comcast.net>

Mike Waychison wrote:

>
>
> If I understand what Hans is looking to get done, he's asking for
> someone to architect a system where any given process can be restricted
> to seeing/accessing a subset of the namespace (in the sense of "a tree
> of directories/files").  Eg: process Foo is allowed access to write to
> /etc/group, but _not_ allowed access to /etc/shadow, under any
> circumstances && Foo will be run as root.  Hell, maybe Foo is never able
> to even _see_ /etc/shadow (making it a true shadow file :).

You are correct, you cannot even see /etc/shadow.

The term mask may be more communicative than view.  We are starting to 
use the term mask.

>
> Hans, correct me if I misunderstood.
>
> [*] Somebody really should s/struct namespace/struct mounttable/g (or
> even mounttree) on the kernel sources.  'Namespace' isn't very
> descriptive and it leads to confusion :(
>
> --
> Mike Waychison
> Sun Microsystems, Inc.
> 1 (650) 352-5299 voice
> 1 (416) 202-8336 voice
> http://www.sun.com
>
> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> NOTICE:  The opinions expressed in this email are held by me,
> and may not represent the views of Sun Microsystems, Inc.
> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

