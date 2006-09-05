From: "Peter" <sw98234-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>
Subject: Re: reiser4 corruption on initial copy
Date: Tue, 5 Sep 2006 18:53:06 +0000 (UTC)
Message-ID: <edkh2i$oq$1@sea.gmane.org>
References: <ed9412$2r9$1@sea.gmane.org> <edhdda$3tm$1@sea.gmane.org>
	<200609051330.54728.vs@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-29813-reiserfs=m.gmane.org-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
list-help: <mailto:reiserfs-list-help-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
list-post: <mailto:reiserfs-list-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
Errors-To: flx-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org
Sender: news <news-WnDAp88bSu3NLxjTenLetw@public.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org

On Tue, 05 Sep 2006 13:30:54 +0400, Vladimir V. Saveliev wrote:

> hello
> 
> On Monday 04 September 2006 18:32, Peter wrote:
>> On Fri, 01 Sep 2006 11:02:58 +0000, Peter wrote:
>> > I recently copied over my / partition from a reiserfs to a reiser4
>> > partition. This may be user error, but I wanted to report it anyway.
>> >
>> > Booting off a live cd- I did the following.
>>
>> snip...
>>
>> I was able to duplicate the problem. Apparently, the Sabayon live cd does
>> not unmount locally mounted partitions. 
> 
> That should not be a problem if sync is called after copy is completed.
> 
> It looks like Sabayon live cd even does not care to call sync on reboot.
> 

which clearly explains a lot of the headaches I had when creating or
moving partitions from w/in it!

I'll forward this thread to upstream.

-- 
Peter
+++++
Do not reply to this email, it is a spam trap and not monitored.
I can be reached via this list, or via 
jabber: pete4abw at jabber.org
ICQ: 73676357

