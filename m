From: "Thomas Graham" <lkthomas@sml.dyndns.org>
Subject: Re: Bugs?
Date: Sun, 17 Aug 2003 14:54:04 +0800 (HKT)
Message-ID: <1626.192.168.0.97.1061103244.squirrel@sml.dyndns.org>
References: <4962.192.168.0.97.1061093048.squirrel@sml.dyndns.org>
        <20030817185230.GA2980@backtop.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-15346-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030817185230.GA2980@backtop.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: zam@namesys.com
Cc: reiserfs-list@namesys.com


> On Sun, Aug 17, 2003 at 12:04:08PM +0800, Thomas Graham wrote:
>> WARNING: Flushing like mad: (number)
>>  reiser4[mount(17)]: commit_current_atom
>> (fs/reiser4/txnmgr.c:1023)[nikita-3176]:
>>
>> I couldn't even login to my new reiser4 linux,
>
> Did it boot and pass the init scripts?
INIT: version 2.85 booting
The system is coming up. Please wait
WARNING message repeating... start from here...


>
>> anyone have idea why ?
>
> Thank you for the report. Yes, it is a bug.
>
> Is your reiser4 partition mounted on /?  Can you describe what linux
> system did you put on reiser4?

I am using CRUX ( built from scratch distro ), yep, I am using reiser4 as
root partition "/"

>
>> --
>> HK Celtic Orchestra leader and coordanator: Thomas Graham Lau
>> Phone number: 852-93239670    (24hours a day, 7days a week non-stop
>> phone) Web site: http://sml.dyndns.org
>> Email: lkthomas@sml.dyndns.org
>
> --
> Alex.




