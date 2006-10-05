From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: is quotacheck slow with reiserfs
Date: Fri, 6 Oct 2006 02:09:11 +0400
Message-ID: <200610060209.11952.vs@namesys.com>
References: <20061005203445.GA7650@apartia.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30008-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20061005203445.GA7650@apartia.fr>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Louis-David Mitterrand <vindex+lists-reiserfs-list@apartia.org>
Cc: reiserfs-list@namesys.com

Hello

On Friday 06 October 2006 00:34, Louis-David Mitterrand wrote:
> Hello,
> 
> On a 200-user mail server with a 500gb reiser3 fs, quotacheck takes an 
> hour at boot time. This is a mail server with 200 users. 
> 
which linux version is in use on the server?

> Is that normal? Is there a way to speed it up?
> 

How do users store their mails? If they store one mail in a separate file, then quotacheck is to iterate over
a lot files which can be very time consuming.

> Thanks,
> 
> 
