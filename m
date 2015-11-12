From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [PATCHv2 3/3] reiser4: mark pages created during tail2extent
 conversion as dirty.
Date: Thu, 12 Nov 2015 16:50:09 +0100
Message-ID: <5644B531.8030003@gmail.com>
References: <1445727740-12361-1-git-send-email-intelfx100@gmail.com>
 <1445727740-12361-4-git-send-email-intelfx100@gmail.com>
 <56408F30.3060404@gmail.com> <564318AD.4080503@gmail.com>
 <56446331.2090106@gmail.com> <1447327890.926.5.camel@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-type:content-transfer-encoding;
        bh=D1s7QoszHZaq0l1SD5vX6BDeKGYLX0eRdmie0v5pTMs=;
        b=kjQyDOi6FMeUSkmySROSgxWvjWYs6CP7xnE5ZgAw/ltGIiRgo+ZSdYHRd5PDzxTj5e
         GFKLft5AkkbB8GOFZs9qlPF8wKFsIBUbZy7sVFhlhFhZPnjbq8697OEyVXgbrsXreiDx
         3kMdf+c5w3ioaVZtbsLuqfwW+tlBBv6RXZlZzY28uSui4BQZ/sSPbc7WlsMcCc1D9F+x
         yJU9BOM4WQWJh/+R4m70ksW+pOMsrLi8pW8SSlZVpQwsXCePgeYPbmys0/BnwwZobIdL
         I2PLNmgaowx1+fr8knjZqN8XUj5w2LHgue0mFACndHPgdEVf2hZpP8yePRXPAywfUA9k
         OTQg==
In-Reply-To: <1447327890.926.5.camel@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>, reiserfs-devel@vger.kernel.org



On 11/12/2015 12:31 PM, Ivan Shapovalov wrote:
> On 2015-11-12 at 11:00 +0100, Edward Shishkin wrote:
>> On 11/11/2015 11:30 AM, Edward Shishkin wrote:
>>>
>>> On 11/09/2015 01:18 PM, Edward Shishkin wrote:
>>>> On 10/25/2015 01:02 AM, Ivan Shapovalov wrote:
>>>>> This is responsible for an oops in v4.2 in
>>>>> write_jnodes_to_disk_extent() -> set_page_writeback().
>>>
>>> As to me, this patch doesn't prevent the oops,
>>> so someone else forgets to set pages dirty...
>>
>> False alarm: I applied to the old stuff..
>> Everything woks without the hack in
>> write_jnodes_to_disk_extent().
>> Good work! Merged to reiser4-for-4.2.3.
> Hi Edward,
>
> Glad to hear that. I was already halfway recovering my debug patches
> for collecting stacktraces and related information and was going to ask
> you to reproduce :)
>
>>>>> The pages needs to be marked dirty before marked writeback.
>>>>>
>>>>>   From a similar problem in f2fs:
>>>>> "The cgroup attaches inode->i_wb via mark_inode_dirty and when
>>>>> set_page_writeback is called, __inc_wb_stat() updates i_wb's
>>>>> stat.
>>>>>
>>>>> So, we need to explicitly call set_page_dirty-
>>>>>> __mark_inode_dirty in
>>>>> prior to any writebacking pages."
>>>>>
>>>>> Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
>>>>> ---
>>>>>    fs/reiser4/plugin/file/tail_conversion.c | 1 +
>>>>>    1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/fs/reiser4/plugin/file/tail_conversion.c
>>>>> b/fs/reiser4/plugin/file/tail_conversion.c
>>>>> index 7542c03..c856b73 100644
>>>>> --- a/fs/reiser4/plugin/file/tail_conversion.c
>>>>> +++ b/fs/reiser4/plugin/file/tail_conversion.c
>>>>> @@ -175,6 +175,7 @@ static int replace(struct inode *inode,
>>>>> struct
>>>>> page **pages, unsigned nr_pages,
>>>>>                                    i_mapping));
>>>>>            if (result)
>>>>>                break;
>>>>> +        set_page_dirty_notag(pages[i]);
>>>>
>>>> So, at this point the page is dirty but not uptodate.
>>>> I am confused with this. Why not to set the page
>>>> uptodate right before setting it dirty? At this point
>>>> everything has been copied already, so the page is
>>>> in fact uptodate. Could you please try this?
> Have you made this correction in the merged patch?

Yes I have.

> Anyway, could you
> please explain why it should be done one way and not another? What will
> happen if the ordering is left as is?
>
> Is it about marking page uptodate _before unlocking_, so that no one will see it dirty && !uptodate?

Just let's set all the flags in timely fashion.
Otherwise it would mean a bad style.

Thanks,
Edward.
