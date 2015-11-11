From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [PATCHv2 3/3] reiser4: mark pages created during tail2extent
 conversion as dirty.
Date: Wed, 11 Nov 2015 11:30:05 +0100
Message-ID: <564318AD.4080503@gmail.com>
References: <1445727740-12361-1-git-send-email-intelfx100@gmail.com>
 <1445727740-12361-4-git-send-email-intelfx100@gmail.com>
 <56408F30.3060404@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-type:content-transfer-encoding;
        bh=s/FG7ggfRBhu+83jMgprUddSl/E8pao8LeQWaUOJq6I=;
        b=PBHPRb4fik38RZDbEgsjHnThQSMmpacfkCZqmCktifX9WzVaJtW6xhF4yfbN6RmUoY
         yGSUrFihS7Y4jRxaVbUcKDqb5VoUPI6meCGi07gEPtTzWLN8OLJ+fgmdGdhqx0gLofdh
         2KsD2uROSicJDz8sDqbQSr277fXEXKwf55XOtWOKB1+bibitBkqsMl02F00AbDCJJeAB
         dGg010RgH/kwCeDt3b6hY3DAXcvnfjFg1RUssSQyfUUiqlYlJ5hsHPsXcadgYpzs7oS4
         p+PDidcznfNOq0WtrJlkQWjYOY7yUrmkZNuwQ4sIgQxSq5SkvGqcIlPWwhUuYnkNnVu0
         wp9g==
In-Reply-To: <56408F30.3060404@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>, reiserfs-devel@vger.kernel.org



On 11/09/2015 01:18 PM, Edward Shishkin wrote:
> On 10/25/2015 01:02 AM, Ivan Shapovalov wrote:
>> This is responsible for an oops in v4.2 in
>> write_jnodes_to_disk_extent() -> set_page_writeback().


As to me, this patch doesn't prevent the oops,
so someone else forgets to set pages dirty...

Thanks,
Edward.


>>
>> The pages needs to be marked dirty before marked writeback.
>>
>>  From a similar problem in f2fs:
>> "The cgroup attaches inode->i_wb via mark_inode_dirty and when
>> set_page_writeback is called, __inc_wb_stat() updates i_wb's stat.
>>
>> So, we need to explicitly call set_page_dirty->__mark_inode_dirty in
>> prior to any writebacking pages."
>>
>> Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
>> ---
>>   fs/reiser4/plugin/file/tail_conversion.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/fs/reiser4/plugin/file/tail_conversion.c 
>> b/fs/reiser4/plugin/file/tail_conversion.c
>> index 7542c03..c856b73 100644
>> --- a/fs/reiser4/plugin/file/tail_conversion.c
>> +++ b/fs/reiser4/plugin/file/tail_conversion.c
>> @@ -175,6 +175,7 @@ static int replace(struct inode *inode, struct 
>> page **pages, unsigned nr_pages,
>>                                   i_mapping));
>>           if (result)
>>               break;
>> +        set_page_dirty_notag(pages[i]);
>
>
> So, at this point the page is dirty but not uptodate.
> I am confused with this. Why not to set the page
> uptodate right before setting it dirty? At this point
> everything has been copied already, so the page is
> in fact uptodate. Could you please try this?
>
> Thanks,
> Edward.
>
>
>>           unlock_page(pages[i]);
>>           result = find_or_create_extent(pages[i]);
>>           if (result) {
>

