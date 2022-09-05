From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v2 01/14] fs/buffer: remove __breadahead_gfp()
Date: Sun, 4 Sep 2022 22:52:16 -0700
Message-ID: <YxWOkPZ8eggVKbg4@infradead.org>
References: <20220901133505.2510834-1-yi.zhang@huawei.com>
 <20220901133505.2510834-2-yi.zhang@huawei.com>
Mime-Version: 1.0
Return-path: <linux-ext4-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=; b=rcrKA4ZssVM5s2966RXlKJk/CQ
        GRHxMdQOOWGNnWCPNxp3yrIYlRUxMmh1vCxvMOFQbdAx8hhmZJjgH9p+16vhAgxAH83ESL/Ao1t3A
        UB+1TLy7rXttE8fUFQjY97gGFOoP8fR3iaw5Rg16PZ0LvgchkLApV7iiSxM9JvlkuA1YHmQLPwQgE
        Iq4ruVUotF3jVrifwEm8OmhChA/PzqUAqbi18zhesNRmQI6eoSqoZhf49Ip0hsalei1VB1/s+2tsI
        o167o9FKkKXdM8Ih8UNbX8eeQJCDE7WkOo2VfIOmVJ8rSW6OBzyPGMKa60dgjvV3wpJvuLO37UB5X
        TNhO0hxg==;
Content-Disposition: inline
In-Reply-To: <20220901133505.2510834-2-yi.zhang@huawei.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zhang Yi <yi.zhang@huawei.com>
Cc: linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, cluster-devel@redhat.com, ntfs3@lists.linux.dev, ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org, jack@suse.cz, tytso@mit.edu, akpm@linux-foundation.org, axboe@kernel.dk, viro@zeniv.linux.org.uk, rpeterso@redhat.com, agruenba@redhat.com, almaz.alexandrovich@paragon-software.com, mark@fasheh.com, dushistov@mail.ru, hch@infradead.org, chengzhihao1@huawei.com, yukuai3@huawei.com

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
