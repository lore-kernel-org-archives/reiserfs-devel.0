From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: Bugs?
Date: Sun, 17 Aug 2003 22:52:30 +0400
Message-ID: <20030817185230.GA2980@backtop.namesys.com>
References: <4962.192.168.0.97.1061093048.squirrel@sml.dyndns.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15344-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <4962.192.168.0.97.1061093048.squirrel@sml.dyndns.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Graham <lkthomas@sml.dyndns.org>
Cc: reiserfs-list@namesys.com

On Sun, Aug 17, 2003 at 12:04:08PM +0800, Thomas Graham wrote:
> WARNING: Flushing like mad: (number)
>  reiser4[mount(17)]: commit_current_atom
> (fs/reiser4/txnmgr.c:1023)[nikita-3176]:
> 
> I couldn't even login to my new reiser4 linux,

Did it boot and pass the init scripts? 

> anyone have idea why ?

Thank you for the report. Yes, it is a bug.

Is your reiser4 partition mounted on /?  Can you describe what linux system
did you put on reiser4? 

> -- 
> HK Celtic Orchestra leader and coordanator: Thomas Graham Lau
> Phone number: 852-93239670    (24hours a day, 7days a week non-stop phone)
> Web site: http://sml.dyndns.org
> Email: lkthomas@sml.dyndns.org

-- 
Alex.

