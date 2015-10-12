From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [PATCH 3/3] reiser4: in our own sync writes, mark pages dirty
 before marking them writeback.
Date: Mon, 12 Oct 2015 11:07:35 +0200
Message-ID: <561B7857.1030000@gmail.com>
References: <1444389417-14929-1-git-send-email-intelfx100@gmail.com>
 <1444389417-14929-4-git-send-email-intelfx100@gmail.com>
 <5617C0C1.6060806@gmail.com> <1444398642.6030.3.camel@gmail.com>
 <5617D55D.2040908@gmail.com> <1444410842.2213.5.camel@gmail.com>
 <56182257.7060304@gmail.com> <1444473863.4257.10.camel@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-type:content-transfer-encoding;
        bh=Ac371Phc/Y9eqOH/QnaehGgFlzuf2DKiXIPrzldr37E=;
        b=xmQ4q/a8Rvs9kWwnUGPl0BYd71nhxfnIEH1WT1MvasxpFB8PcialvJBslhoA5/i9qv
         +3PsleGXQi/7Zv64YBBrFwZH/puxyVuToQjkZEyy1UDfFZP10+4ZsJ/rZmweH/WNNmbq
         oiHhM2/ZhKnMxwTTu2YWmHqoI4m8nIrYo+Xw2PXOWmDXd/vtre4YYOr2CGaFdVnKDhF0
         vXlgieEGydJ6gZ7K//2BOuF+9/u0NODI2esoK58GB6xyVTIH90jKekyf7vakcsInE+ra
         0g6l8SlDLDS5LDEOr5QEMkjRQsy6QnB776Q/adC59IT1NzejyynvAifCcpINpX/QBxjj
         yh9A==
In-Reply-To: <1444473863.4257.10.camel@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: Oleg Drokin <green@linuxhacker.ru>, reiserfs-devel@vger.kernel.org

On 10/10/2015 12:44 PM, Ivan Shapovalov wrote:
[...]
> I didn't check the code yet; I'll probably try with that assertion converted into warning and split into two
> (one for formatted and another for unformatted nodes), so that I could check what type of nodes is responsible
> for generating the final oops in set_page_writeback().

I suppose that oops happens on unformatted nodes, because
all formatted nodes have the same host - a special "fake" inode
with number 1, which gets i_wb at mount time (init_fake_inode()
calls inode_attach_wb()).

Edward.

>
>> For unformatted nodes only code review
>> can help. Normally, all modifications of unformatted nodes should
>> look like the following:
>>
>> struct page *page = jnode_page(node);
>> lock_page(page);
>> char *data = kmap(page);
>> /* modifications are going here */
>> kunmap(page);
>> set_page_dirty_nobuffers(page); /* somebody forgets to do this */
>> unlock_page(page);
>>
>> Modifications of formatted nodes should look like the following:
>>
>> longterm_lock_znode(node);
>> zload(node);
>> /* modifications are going here */
>> zrelse(node);
>> znode_make_dirty(node); /* somebody forgets to do this */
>> longterm_unlock_znode();
>>
>> Anyway, we can use your patch 3 as a temporal fixup.
> The most persistent things are those conseived as the most temporary
> ones... ;)

