From: "Peter" <sw98234-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>
Subject: Re: reiser4 corruption on initial copy
Date: Mon, 4 Sep 2006 14:32:11 +0000 (UTC)
Message-ID: <edhdda$3tm$1@sea.gmane.org>
References: <ed9412$2r9$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-29799-reiserfs=m.gmane.org-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
list-help: <mailto:reiserfs-list-help-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
list-post: <mailto:reiserfs-list-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
Errors-To: flx-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org
Sender: news <news-WnDAp88bSu3NLxjTenLetw@public.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org

On Fri, 01 Sep 2006 11:02:58 +0000, Peter wrote:

> I recently copied over my / partition from a reiserfs to a reiser4
> partition. This may be user error, but I wanted to report it anyway.
> 
> Booting off a live cd- I did the following.
> 
snip...

I was able to duplicate the problem. Apparently, the Sabayon live cd does
not unmount locally mounted partitions. Thus, the reiser4 partitions are
unclean. When I boot up to the newly created and copied partition, I get
the errors I referred to earlier. By manually umounting the partitions I
create or copy from -- including /tmp partitions or /var partitions. I do
not get the boot time errors.

HTH

-- 
Peter
+++++
Do not reply to this email, it is a spam trap and not monitored.
I can be reached via this list, or via 
jabber: pete4abw at jabber.org
ICQ: 73676357

