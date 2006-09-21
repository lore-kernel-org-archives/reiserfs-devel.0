From: "Peter" <sw98234-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>
Subject: Re: r4 observations
Date: Thu, 21 Sep 2006 11:18:41 +0000 (UTC)
Message-ID: <eetseh$vjq$2@sea.gmane.org>
References: <ees2cj$15h$1@sea.gmane.org> <200609211502.01497.vs@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-29960-reiserfs=m.gmane.org-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
list-help: <mailto:reiserfs-list-help-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
list-post: <mailto:reiserfs-list-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
Errors-To: flx-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org
Sender: news <news-WnDAp88bSu3NLxjTenLetw@public.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org

On Thu, 21 Sep 2006 15:02:01 +0400, Vladimir V. Saveliev wrote:

> Hello
> 
> On Wednesday 20 September 2006 22:47, Peter wrote:
>> I booted from a non-reiser4 partition in order to make a backup of my main 
>> / which was a r4 partition.
>> 
>> After the backup, I unmounted the drive explicitly, then rebooted.
>> 
>> I did not use the backed up drive for anything except tar-ring its files.
>> 
>> On next boot to the r4 / partition, all kinds of file not found errors
>> occurred. I booted again to my non-r4 partition, and ran fsck.reiser4
>> --check -y there were fatal errors on my r4 /.
>> 
>> The backup was fine. I downgraded back to reiserfs which does not exhibit
>> this problem.
>> 
>> I have not experienced any problem with other r4 partitions. Just /.
>> /home, /tmp, /src, etc. are fine.
>> 
>> Unfortunately, I don't have time to keep wondering where the problem is or
>> why. Perhaps it's the kernel or the init scripts. Nonetheless, the
>> instability of whatever the problem is is unnerving.
>> 
> 
> Please provide information about which kernel and which reiser4 did you use.
> Am I correct that you were trying to run gentoo on reiser4?

Yes, Vladimir. When making the backup, I was not running Gentoo at all. I
was running Slackware 10.2. I booted into Slackware with the beyond
patchset (ck superset) based on 2.6.17.11 with the reiser4 2.6.17-3 patch.
All of the work on backup mount and unmount was on Slackware. It was when
rebooting back into Gentoo (with the init and base layout which DID NOT
CAUSE a boot problem) that the fatal errors occurred. Interestingly, and
maybe this is helpful, only the / partition seems to be affected. I have
observed no problematic behavior with any of the other three partitions I
used r4 for. In fact, even though I downgraded / to reiserfs3, the other
r4 partitions work fine. Please let me know if I can provide additional
information.

-- 
Peter
+++++
Do not reply to this email, it is a spam trap and not monitored.
I can be reached via this list, or via 
jabber: pete4abw at jabber.org
ICQ: 73676357

