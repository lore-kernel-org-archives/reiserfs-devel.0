From: Oleg Drokin <green@namesys.com>
Subject: Re: Getopt improvements
Date: Fri, 28 Feb 2003 16:15:35 +0300
Message-ID: <20030228161535.C10830@namesys.com>
References: <3E5D26A2.7010804@suse.com> <20030227092551.C28643@namesys.com> <3E5E312C.50406@suse.com> <3E5E730C.7030804@namesys.com> <3E5E84B2.90708@suse.com> <3E5E92BA.4090307@namesys.com> <20030228100147.A878@namesys.com> <3E5F504A.6010902@namesys.com> <20030228154157.A10830@namesys.com> <3E5F5B81.1040602@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13005-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3E5F5B81.1040602@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Jeff Mahoney <jeffm@suse.com>, Reiserfs List <reiserfs-list@namesys.com>

Hello!

On Fri, Feb 28, 2003 at 03:52:17PM +0300, Hans Reiser wrote:

> >>Incompatible options should fail as they represent error.  Feel free to 
> >>argue with that.
> >Hm, I am not going to argue. But we never had this kind of logic.
> >Usually the latest-specified option was taking effect.
> Conflicts in the same command line should fail, latest command line 
> should override.  Yes?

Ok, I will think on how to implement that.

Bye,
    Oleg
