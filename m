From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiserfs - recommendations for small files
Date: Tue, 20 Oct 2009 01:34:17 +0200
Message-ID: <4ADCF779.1060905@gmail.com>
References: <84c89ac10910171111n69b9832fr42d30aa07d84b262@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <84c89ac10910171111n69b9832fr42d30aa07d84b262@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Viji V Nair <viji@fedoraproject.org>
Cc: reiserfs-devel@vger.kernel.org

Viji V Nair wrote:
> Hi,
>
> System : Fedora 11 x86_64
> Current Filesystem: 150G ext4 (formatted with "-T small" option)
> Number of files: 50 Million, 1 to 30K png images
>
> We are generating these files using a python programme and getting
> very slow IO performance. While generation there are only writes, no
> read. After generation there are heavy read and no write. These files
> are not in a single directory, this is a pyramid structure. There are
> total 15 pyramids and coming down from top to bottom the sub
> directories and files  are multiplied by a factor of 4
>
> I am looking for an alternate file system and best
> practices/recommendation to get a better performance. What the
> optimisation methods available in reiserfs for small files?
>   

I think that default tail packing policy would be the best for you.
Also use tea hash.

Thanks,
Edward.

> Any suggestions of the above are greatly appreciated.
>
> Viji
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>   

