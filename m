From: Louis-David Mitterrand <vindex+lists-reiserfs-list@apartia.org>
Subject: Re: is quotacheck slow with reiserfs
Date: Fri, 6 Oct 2006 09:50:17 +0200
Message-ID: <20061006075016.GA2414@apartia.fr>
References: <20061005203445.GA7650@apartia.fr> <200610060209.11952.vs@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-30012-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200610060209.11952.vs@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On Fri, Oct 06, 2006 at 02:09:11AM +0400, Vladimir V. Saveliev wrote:
> 
> On Friday 06 October 2006 00:34, Louis-David Mitterrand wrote:
> > 
> > On a 200-user mail server with a 500gb reiser3 fs, quotacheck takes an 
> > hour at boot time. This is a mail server with 200 users. 
> > 
> which linux version is in use on the server?

Debian unstable with latest kernel 2.6.17.

> > Is that normal? Is there a way to speed it up?
> > 
> 
> How do users store their mails? If they store one mail in a separate 
> file, then quotacheck is to iterate over
> a lot files which can be very time consuming.

We use maildir, so, yes, it's a lot of files.

Isn't there a way to run quotacheck in the background while daemons 
start serving users? 

Or must it absolutely be run at mount time to be effective?

Thanks,
