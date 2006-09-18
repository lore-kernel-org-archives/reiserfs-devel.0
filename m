From: "Peter" <sw98234-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>
Subject: Re: reiser4: mount -o remount,ro / causes error on reboot
Date: Mon, 18 Sep 2006 09:52:12 +0000 (UTC)
Message-ID: <eelq8c$f6t$1@sea.gmane.org>
References: <ee1gcu$dgb$1@sea.gmane.org> <eebeu5$mi1$1@sea.gmane.org>
	<450D97C9.7060808@ee.oulu.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-29922-reiserfs=m.gmane.org-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
list-help: <mailto:reiserfs-list-help-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
list-post: <mailto:reiserfs-list-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
Errors-To: flx-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org
Sender: news <news-WnDAp88bSu3NLxjTenLetw@public.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: reiserfs-list-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org

On Sun, 17 Sep 2006 21:45:29 +0300, Jussi Suutari-Jääskö wrote:

> Peter wrote:
>> On Sun, 10 Sep 2006 17:01:18 +0000, Peter wrote:
>>
>> this bug was also reported on gentoo wrt the newer baselayout. Indications
>> are it may be a r4 issue, although no one seems to know why!
>>
>> http://bugs.gentoo.org/show_bug.cgi?id=144093
>>
>>   
> I have the same problem, segfault on boot if the system was shutdown 
> properly.
> For me the trouble appeared after upgrading to glibc-2.4, there's no 
> problem at
> all with glibc-2.3.6. On my system (amd64 platform with 64-bit gentoo 
> installation)
> it doesn't have anything to do with baselayout, just the glibc.

That does not explain why reverting to baselayout 1.11.15 allows the
system to work! Also, for me, at least, this only occurs with reiser4 as
root, not reiser3. You may be correct about glibc-2.4 but the timing is
inconsistent. I upgraded to 2.4 on 9/1, but did not see the problem until
the baselayout incremented. Did you actually try downgrading your glibc
and if so, did the problem go away?

Would you please add your observation to the bug report? Thx for the input.

-- 
Peter
+++++
Do not reply to this email, it is a spam trap and not monitored.
I can be reached via this list, or via 
jabber: pete4abw at jabber.org
ICQ: 73676357

