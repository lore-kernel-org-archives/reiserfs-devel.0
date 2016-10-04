From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [PATCH] Adjust reiser4 for 3.15: replace
 truncate_inode_pages(..., 0) with truncate_inode_pages_final(...).
Date: Tue, 4 Oct 2016 17:44:26 +0200
Message-ID: <9529a268-cffe-5c42-0942-f944373becff@gmail.com>
References: <20160930063629.13794-1-intelfx@intelfx.name>
 <20160930064332.19365-1-intelfx@intelfx.name>
 <1475218025.19471.1.camel@intelfx.name> <57F26B32.7040807@gmail.com>
 <1475505646.3029.13.camel@intelfx.name>
 <1475523931.3029.17.camel@intelfx.name>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding;
        bh=cFmDalGDX5APNC4ZZ+qV8eeJhIy+GODlyxYZWY7lO/o=;
        b=z/VW829qgGPjluK0tAotOiXNnsKtDqZX2Ua2ko8Omat5EedeoZyH9ZZzs/D5gAh952
         TH/jZ0ZMu3osiXVfXPoBQrU2Lt/qF0jz2QxX1Pvi6wE6Ev/AnRWwSDGjjXC2czkC1j51
         obIfa1c3x1WczDvr8r4pHtkbYJNWE8/inmPvqyDQlZuI16FE8ON+TLwBVdTPiZSFJFFW
         SONWjs0heEZwE35JRxmpW0VsCUoa2rn8dxW1AQi3BX8kdki5esqMPxmZNvXkWUy2HlWn
         c/VLdWWI3xLHxbdapQV7GftaQ5bv+uT2GOPZn//rUSzHo370S+zIeBgrcV2kQGidCTYn
         PXtA==
In-Reply-To: <1475523931.3029.17.camel@intelfx.name>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: intelfx@intelfx.name, reiserfs-devel@vger.kernel.org

Agreed,
we have to call  *_final()

Thanks,
Edward.

On 10/03/2016 09:45 PM, Ivan Shapovalov wrote:
> On 2016-10-03 at 17:40 +0300, Ivan Shapovalov wrote:
>> On 2016-10-03 at 16:29 +0200, Edward Shishkin wrote:
>>> On 09/30/2016 08:47 AM, Ivan Shapovalov wrote:
>>>> On 2016-09-30 at 09:43 +0300, Ivan Shapovalov wrote:
>>>>> [...]
>>>> BTW, this raises a question: in the ->evict_inode path, are we
>>>> ever
>>>> allowed to call plain truncate_inode_pages() (i. e. not
>>>> *_final())?
>>> Actually, I would like to see a kind of assertion 1487 instead:
>>> everything should be already truncated at that point.
>> Do you mean that the assertion should go instead of
>> truncate_inode_pages_final()? Doesn't that function contain extra
>> logic, beyond removing pages?
>>
>> Moreover, that function seems to contain extra logic _before_
>> actually
>> going off and truncating pages. This makes me wonder: doesn't this
>> mean
>> that we _must not ever_ call regular truncate_inode_pages() from
>> inside ->evict_inode()?
>>
>> I do not know VFS enough to answer these kinds of stupid questions...
> Looks like the answer is "no, everything is OK". If ->evict_inode()
> races with remove_mapping() and shadow entries are installed into the
> radix tree, the *_final() call will still catch them. By association
> this means that this call is still needed.
>
> (However, now I wonder how does this work with regular truncate and
> whether the radix tree can hold shadow entries for already truncated
> pages during an inode's lifetime, but this is a purely VFS/mm
> question.)
>

