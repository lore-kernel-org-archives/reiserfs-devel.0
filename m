From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Problems with nfs in 2.6.24
Date: Tue, 26 Feb 2008 13:39:05 +0300
Message-ID: <47C3EC49.6010506@gmail.com>
References: <loom.20080226T095520-901@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <loom.20080226T095520-901@post.gmane.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mat <jackdachef@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

Mat wrote:

>>Would you please pack metadata by
>>debugfs.reiser4 -P /dev/xxx | gzip > meta.gz
>>and let me download the file meta.gz, if possible.
>>What is the name of inaccessible object?
>>    
>>
>
>  
>
>>Thanks,
>>Edward.
>>    
>>
>
>Hi Edward, 
>
>  
>

Hello.

>just a short question:
>
>how big will the package approximately get when packing metadata ?
>  
>

Sven's 45G partition has been packed to 70M file.

Don't bother to pack your corrupted cryptcompress partition:
all disk clusters containing data will be cut, so there will be
nothing interesting.

Edward.

>(I knew I forgot to do something, yesterday :(   )
>
>Many thanks in advance
>
>Mat
>
>-
>To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>  
>

