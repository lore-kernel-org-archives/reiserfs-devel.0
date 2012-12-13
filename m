From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Kernel config option which causes reiser4 to be instable
Date: Thu, 13 Dec 2012 21:51:41 +0100
Message-ID: <50CA3FDD.20307@gmail.com>
References: <CADW=+3n+rKECWNSmzcMeTQaPZrtA3Sr04=yO1cqsd0j09Y43Ww@mail.gmail.com> <3128977.locbVvMWgS@intelfx-laptop> <11611692.SVSRPcoVIL@intelfx-laptop> <21180603.IycRkMTJZZ@intelfx-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=Nkvw8F9D13/R8yl07ElzMF9DkgoBZNS9kDCb30/FLI8=;
        b=bicRd4FaIayBMoxkTl4VZoh8ptOMPd4Zt9LoHhtEfH/c5Mhct+FNe4ekoyaVXPNwbl
         /SfTek2PUp7+0aWdteYmb06Jp9pmg2PNBQhpP8ok/V8VEkkztaBTEz+nC4+GaExu5ti0
         1i2pNMpsB/hqmhP7zomAvbJQEPRfqZOfmac1Ma4WKUvpst5+ayc32EGrGw8XRTW4nMxj
         vpN8/P5UCTALiMt6szEXwZiPcU7STVLC71rlDlXpJYjNU1/H3sL2cFpjy11Ji4Rv9osn
         OUAoDLOggIFcHmzZjDqYedNJetyAkGsYYqjbGQ5Yqfqh/h6871Bdf9mX9Y4Dcej1z2n2
         Tz0Q==
In-Reply-To: <21180603.IycRkMTJZZ@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>, =?UTF-8?B?RHXFoWFuIMSM?= =?UTF-8?B?b2xpxIc=?= <dusanc@gmail.com>

On 12/13/2012 07:56 PM, Ivan Shapovalov wrote:
> On 12 December 2012 07:23:53 Ivan Shapovalov wrote:
>> On 11 December 2012 22:49:47 Ivan Shapovalov wrote:
>>> On 11 December 2012 19:33:39 Edward Shishkin wrote:
>>>> On 12/11/2012 04:08 PM, Ivan Shapovalov wrote:
>>>>> Hello!
>>>> Hello.
>>>>
>>>>> With help of Du=C5=A1an =C4=8Coli=C4=87 <dusanc@gmail.com> who pr=
ovided his kernel
>>>>> config
>>>>> diff I've found a kernel option which, when disabled, greatly red=
uces
>>>>> (hopefully to zero, but need time to verify it) corruption rate i=
n
>>>>> reiser4.
>>>>>
>>>>> It's CONFIG_TRANSPARENT_HUGEPAGE (or something which is used by i=
t
>>>>> like
>>>>> CONFIG_COMPACTION or CONFIG_MIGRATION).
>>>>> For now I'm testing it with CONFIG_TRANSPARENT_HUGEPAGE disabled
>>>> How long?
>>> 12 hours of indexing, scanning, compiling, repeated execution of
>>> "find <mountpoint> -type f -exec grep wtf {} \;" and so on.
>>>
>>>>>    on kernel
>>>>>
>>>>> 3.6.10, and everything seems to be OK so far (so the workaround i=
s
>>>>> version-
>>>>> agnostic).
>>>>>
>>>>> Edward, are there any guesses on what can make reiser4 choke on
>>>>> hugepages/compaction/migration?
>>>> TBH, no ideas. They (hugepages) are _transparent_.
>>>> It means we shouldn't suffer in theory ;)
>>> Maybe it's actually migration who does the damage? If we don't lock=
 the
>>> pages properly and they are "stolen" by the migration code... If th=
is is
>>> the case, I shall eventually get corruptions with current setup (si=
nce
>>> migration/compaction is not disabled).
>>> If I get them, I'll rebuild without migration at all and will see i=
f
>>> corruptions disappear completely. (Then they should disappear, if t=
he
>>> prediction is true.)
>> ...So, the kernel did not pass the overnight testing with usual erro=
rs of
>> "cluster corrupted" and etc (which is just as planned).
>>
>> I'm now rebuilding without CONFIG_COMPACTION and CONFIG_MIGRATION.
> So far the kernel built without CONFIG_MIGRATION worked flawless. I g=
ave it
> double testing time compared to the previous attempt - that is, 2 day=
s.
>
> Regarding the actual solution (as plainly disabling kernel features d=
oesn't
> count as one):
>
> I have a guess that the problem is related to default ->migratepage()=
 of
> struct address_space_operations (which is not no-op, but a "generic"
> implementation by default).

Hmm, I didn't know about this new aop :(

Right now I can not surely say, that it is the default ->migratepage(),
who caused corruptions, however quick look showed, that it works
incorrectly: reiser4_writepage() doesn't necessarily make page clean.
So, yes, it would be better to disable migration for our mappings for
now..

Thank you for the finding!

Edward.

>
> So I've just attempted to "quickfix" the problem by explicitly settin=
g the
> said pointer to fail_migrate_page and building 3.7.0 with all three
> migration-related options enabled. I'll let the new kernel to work ov=
ernight
> to see if it indeed fixes The Problem.
>
> Attaching the reiser4 patch for 3.7 (just rebased the one for 3.6 aga=
inst new
> kernel version, no apparent API changes spotted by me) and that quick=
fix one-
> liner (completely untested as of now).
>
> Thanks,
> Ivan.
>
>>>>>    I'm not even barely familiar with the kernel
>>>>>
>>>>> internals.
>>>>>
>>>>> Thanks,
>>>>> Ivan.

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
