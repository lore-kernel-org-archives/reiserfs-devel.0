From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [Bug 12218] inconsistent reiserfs filesystem freezes the kernel
Date: Sun, 25 Jan 2009 18:19:00 +0300
Message-ID: <497C82E4.10204@gmail.com>
References: <bug-12218-13768@http.bugzilla.kernel.org/> <20090110210949.DA7DF10800F@picon.linux-foundation.org> <20090125114432.GN10810@rivendell>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20090125114432.GN10810@rivendell>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Csillag Tamas <cstamas@digitus.itk.ppke.hu>, Reiserfs mailing list <reiserfs-devel@vger.kernel.org>

Csillag Tamas wrote:
> Here is the link:
> http://users.itk.ppke.hu/~cstamas/priv/meta.bz2
>
>   

There are 2 fixable corruptions of your image,
but unfortunately I can not  reproduce an oops
(by reading all its files). Is it reproducible with
the original partition?

Thanks,
Edward.

> I update the ticket in a moment.
>
> On Sat, Jan 10, 2009 at 01:09:49PM -0800, bugme-daemon@bugzilla.kernel.org wrote:
>   
>> http://bugzilla.kernel.org/show_bug.cgi?id=12218
>>     
> ...
>   
>> and provide the meta.bz2 for downloading.
>>
>> However, the best way is to report about reproducible
>> oops _before_ recovering your partition.
>>     
>
> Regards,
>   cstamas
>   

