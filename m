From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: reiser4 and swsusp (take 2)
Date: Fri, 26 Mar 2004 12:22:19 +0300
Message-ID: <20040326092219.GX15733@backtop.namesys.com>
References: <200403252244.39083.filipe@rnl.ist.utl.pt>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17488-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200403252244.39083.filipe@rnl.ist.utl.pt>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Filipe Almeida <filipe@rnl.ist.utl.pt>
Cc: reiserfs-list@namesys.com

On Thu, Mar 25, 2004 at 10:44:37PM +0000, Filipe Almeida wrote:
> Hi,
> 
> I believe I have found the issue with software suspend and the repacker.
> The refrigerator() call inside prepare_repacking_session() is called regularly 
> and should work as expected. The problem is that the software suspend system, 
> before signaling all kernel threads, calls sys_sync() to flush the buffers 
> out to disk. If sys_sync() is called while the repacker is running, it will 

PF_FREEZE is not set yet?

> only return at the end of the repacker run. 

It is a wrong behavior, regardless to sw suspend.
However, the repacker is not a goal for the next reiser4 snapshot.
Its (repacker) development is dalayed until we get reiser4 stable.

> So, if you start the repacker and 
> call software suspend, the system will only suspend at the end of repacking, 
> which could be a really long time.
> 
> Hope it helps...

great thanks.

> 
> Regards,
> Filipe Almeida
> 
> --
> Filipe Almeida <filipe@rnl.ist.utl.pt>
> http://mega.ist.utl.pt/~filipe/

-- 
Alex.
