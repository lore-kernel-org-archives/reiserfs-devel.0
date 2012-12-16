From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Kernel config option which causes reiser4 to be instable
Date: Sun, 16 Dec 2012 16:36:38 +0100
Message-ID: <50CDEA86.3070104@gmail.com>
References: <CADW=+3n+rKECWNSmzcMeTQaPZrtA3Sr04=yO1cqsd0j09Y43Ww@mail.gmail.com> <1389717.RAQAZZVsPt@intelfx-laptop> <50CB088C.3090801@gmail.com> <8441852.S0Hz7rjb2F@intelfx-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=Egn8Wy5kA5kV9SWNtLZgoZ34W2mtf8keGev/2Crzr8E=;
        b=RJzYIIwd/BlgVumCdoZqwjCvpgrdW/3MLOgdK6OnjNVXeT6o5k9/2Kf5r/VZGqyguD
         Zz1l+BKO49WJiOWLUKR7WPX2dmVA/AXJUeSc2aFfyxX8WMC48nLqEI/PKyDNFqltK7jg
         K3HjWyw1TRYgY5UTW5WGYCL5ocQMjSHHdPCCGEr0AAqi+CXZyKsSbyKBtsy0hWw7f/Ki
         vWqF7l8L+ZnDkD6fztutk2EgoNwqrytNG80MWaLthKtlyzyGS/2hld2Dx8vhUtHYqO1x
         C7V23wRd3Y2PurcS4Ld3+yIhZD6zSeOtGLe68Gl1WpBIeZT6P5XFCjrYpYdfpmgmQvHw
         zp/A==
In-Reply-To: <8441852.S0Hz7rjb2F@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>

On 12/14/2012 07:20 PM, Ivan Shapovalov wrote:
> On 14 December 2012 12:07:56 Edward Shishkin wrote:
>> On 12/14/2012 04:14 AM, Ivan Shapovalov wrote:
>>> On 13 December 2012 23:47:10 Edward Shishkin wrote:
>>>> On 12/11/2012 09:54 PM, Du=C5=A1an =C4=8Coli=C4=87 wrote:
>>>>> On Tue, Dec 11, 2012 at 7:33 PM, Edward Shishkin
>>>>>
>>>>> <edward.shishkin@gmail.com>    wrote:
>>>>>> On 12/11/2012 04:08 PM, Ivan Shapovalov wrote:
>>>>>>> Hello!
>>>>>>
>>>>>> Hello.
>>>>>>
>>>>>>> With help of Du=C5=A1an =C4=8Coli=C4=87<dusanc@gmail.com>    wh=
o provided his kernel
>>>>>>> config
>>>>>>> diff I've found a kernel option which, when disabled, greatly r=
educes
>>>>>>> (hopefully to zero, but need time to verify it) corruption rate=
 in
>>>>>>> reiser4.
>>>>>>>
>>>>>>> It's CONFIG_TRANSPARENT_HUGEPAGE (or something which is used by=
 it
>>>>>>> like
>>>>>>> CONFIG_COMPACTION or CONFIG_MIGRATION).
>>>>>>> For now I'm testing it with CONFIG_TRANSPARENT_HUGEPAGE disable=
d
>>>>>>
>>>>>> How long?
>>>>>
>>>>> For me the difference in uptime is months without vs hours with i=
t :D
>>>>> on 2.6.39.4
>>>>
>>>> Hm, indeed: my setup with enabled migration can not survive even o=
ne
>>>> kernel compilation, while with disabled migration everything looks=
 ok..
>>>
>>> The overnight testing also showed no errors...
>>> So shall we release reiser4-for-3.7 and announce FIXED(?) once agai=
n?
>>>
>>> :)
>>
>> I worry that migration is mandatory option for hugepages.
>> Does fail_migrate_page() work with hugepages?
>
> _Apparently_ yes. We have a counter named "compact_pagemigrate_failed=
" in
> /proc/vmstat (documented in vm/transhuge.txt), which means that faili=
ng a page
> migration is not a critical event. So hugepages and compaction will w=
ork,
> albeit quite less effectively...
>
> ...And I've immediately got a bunch of (presumably silly) questions


Nop. Good questions.


  while
> trying to implement ->migratepage().
>
> 1) Why it is needed to writeback dirty pages before migrating them?
>
> 2) Looking at the default implementation (fallback_migrate_page()), w=
hat is
> the meaning of migrating a released page?


To make sure that nobody uses the page.

Just imagine: we allocate a page, take a reference, make page uptodate.
At this point migration routine steals the page. Then we do kmap(), but
virtual address is wrong. Welcome to corruption..

So, at first, migration routine wants to make sure that file system
doesn't use the page: try_to_release_page() checks a reference
counter (see e.g reiser4_releasepage).


  In other words, doesn't "releasing"
> page anyway mean "completely freeing" it, requiring the fs to read
> corresponding data again?


=46ile system can not use a pointer to page which has been released.
We should obtain a new pointer (via find_get_page(), etc). IMHO dirty
page is a special case (this is regarding your question #1)


>
> 3) As far as I could understand, migrating page (from fs's point of v=
iew) is
> just replacing all internal pointers to the "old" page with pointers =
to the
> new one together with calling predefined functions migrate_page_move_=
mapping()
> and migrate_page_copy(). So here's a question - which structures of r=
eiser4
> (beyond jnode->pg) keep pointers to pages and how to access them, giv=
en a
> single page?


Those pointers shouldn't be a concern, as we use them with reference
counters hold. I don't see where we reuse pointers to released page.

When a page is successfully released, we detach it from jnode (see
page_clear_jnode() in reiser4_releasepage()).


> I can remember cryptcompress's struct cluster_handle which stores an =
array of
> pages...


All cluster handles do have a status of local variables. After
checkin_page_cluster() we forget about the pointers while reference
counters are still hold. After checkout_page_cluster() we drop
reference counters and also forget about the pointers.

I see that default migration routine tries to release only pages
with non-zero private info. It won't work for reiser4, as not all
our pages has non-zero private info. For files managed by
cryptcompress plugin we allocate one jnode per page cluster (by
default 16 pages for page size 4K). And only first page of the
cluster gets non-zero private info. So reiser4_migratepage() should
try to release _all_ pages, not only ones with non-zero private info.

Still don't have ideas why we get corruption in the case of files
managed by (default) unix-file plugin (where we allocate one jnode
per page)..

Edward.


>
> Thanks,
> Ivan.
>
>>
>> Also before the release I'll try to take a look at this:
>> http://marc.info/?l=3Dreiserfs-devel&m=3D135402207623711&w=3D2
>>
>> This failed path might indicate that we adjusted to fs-writeback
>> incorrectly.
>>
>> Edward.
>>
>>> Regards,
>>> Ivan.
>>>
>>>>>>>      on kernel
>>>>>>>
>>>>>>> 3.6.10, and everything seems to be OK so far (so the workaround=
 is
>>>>>>> version-
>>>>>>> agnostic).
>>>>>>>
>>>>>>> Edward, are there any guesses on what can make reiser4 choke on
>>>>>>> hugepages/compaction/migration?
>>>>>>
>>>>>> TBH, no ideas. They (hugepages) are _transparent_.
>>>>>> It means we shouldn't suffer in theory ;)
>>>>>>
>>>>>>>      I'm not even barely familiar with the kernel
>>>>>>>
>>>>>>> internals.
>>>>>>>
>>>>>>> Thanks,
>>>>>>> Ivan.

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
