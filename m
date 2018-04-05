From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH?] reiserfs: prevent panic: don't allow %-char in journal
 dev. name
Date: Thu, 5 Apr 2018 11:04:56 +0200
Message-ID: <6b575956-6498-43c8-dc2c-9e2a0d5564a9@rasmusvillemoes.dk>
References: <d9b518a5-287a-72b3-05f1-ea89e25563ba@infradead.org>
 <20180404184517.9f2b91b856a56f71464f5f7f@linux-foundation.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=g8aDB+bEX1MFrF/XsCMDCYXmtjls7uzajvoJK5+M1ag=;
        b=IlzCrwR0/58uI8eMtOvbVVSFDwicJkBjN8VXL0nHBgMMTBggoEAxE3udiJikqBwZnk
         FwUy722qV0pP19/JS63OTNeBGxBbFOMXBG2rPO6f5/Pgul0iD4kItH3mU/pQqOWZLEIf
         5+WBzfV/1gxG6gr8GyKW6q9EeH9iOehklgiPo=
In-Reply-To: <20180404184517.9f2b91b856a56f71464f5f7f@linux-foundation.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Morton <akpm@linux-foundation.org>, Randy Dunlap <rdunlap@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, reiserfs-devel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, Jeff Mahoney <jeffm@suse.com>, Jan Kara <jack@suse.com>, Frederic Weisbecker <fweisbec@gmail.com>, Artem Bityutskiy <dedekind1@gmail.com>, syzkaller-bugs@googlegroups.com, syzbot+6bd77b88c1977c03f584@syzkaller.appspotmail.com

On 2018-04-05 03:45, Andrew Morton wrote:
> On Wed, 4 Apr 2018 18:25:16 -0700 Randy Dunlap <rdunlap@infradead.org> wrote:
> 
>> From: Randy Dunlap <rdunlap@infradead.org>
>>
>> If the reiserfs mount option's journal name contains a '%' character,
>> it can lead to a WARN_ONCE() in lib/vsprintf.c::format_decode(),
>> saying: "Please remove unsupported %/ in format string."
>> That's OK until panic_on_warn is set, at which point it's dead, Jim.
>>
>> To placate this situation, check the journal name string for a '%'
>> character and return an error if one is found. Also print a warning
>> (one that won't panic the kernel) about the invalid journal name (e.g.):
>>
>>   reiserfs: journal device name is invalid: %/file0
>>
>> (In this example, the caller app specified the journal device name as
>> "%/file0".)
>>
> 
> Well, that is a valid filename and we should support it...
> 
> Isn't the bug in journal_init_dev()?

Urgh. At first I was about to reply that the real bug was in reiserfs.h
for failing to annotate __reiserfs_warning with __printf(). But digging
into it, it turns out that it implements its own printf extensions, so
that's obviously a non-starter. Now, one thing is that some of those
extension clash with existing standard modifiers (%z and %h, so if
someone adds a correct %zu thing to print a size_t in reiserfs things
will break). But, and I hope I'm wrong about this and just hasn't had
enough coffee, this seems completely broken:

        while ((k = is_there_reiserfs_struct(fmt1, &what)) != NULL) {
                *k = 0;

                p += vsprintf(p, fmt1, args);

                switch (what) {
                case 'k':
                        sprintf_le_key(p, va_arg(args, struct
reiserfs_key *));
                        break;

On architectures where va_list is a typedef for a one-element array of
some struct (x86-64), that works ok, because the vsprintf call can and
does update the args metadata. But when args is just a pointer into the
stack (i386), we don't know how much vsprintf consumed, and end up
consuming the same arguments again - only this time we may interpret
some random integer as a struct pointer...

A minimal program showing the difference:

#include <stdio.h>
#include <stdarg.h>

void f(const char *dummy, ...)
{
	va_list ap;
	int i;

	va_start(ap, dummy);
	for (i = 0; i < 5; ++i) {
		vprintf("%d\n", ap);
		printf("%d\n", va_arg(ap, int));
	}
	va_end(ap);
}

int main(int argc, char *argv[])
{
	f("bla", 1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
	return 0;
}

Compiling for native (x86-64), this produces $(seq 10). But with -m32,
one gets 1,1,2,2,3,3,4,4,5,5.

Assuming reiserfs (at least its debugging infrastructure) isn't broken
on a bunch of architectures, I'm obviously missing something
fundamental. Please enlighten me.

Rasmus
