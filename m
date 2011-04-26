From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: File copy problems kde 4.5 to 4.6.1 with reiser4 2.6.38
Date: Tue, 26 Apr 2011 14:39:40 +0200
Message-ID: <4DB6BD0C.7020407@gmail.com>
References: <201103090918.47762.berny@dwami.com>	 <4D7774D7.3030908@dwami.com> <4D7FA356.1000309@gmail.com>	 <201104041142.42496.berny@dwami.com>	 <BANLkTimmZ4GDX2-K=TaNLOMUg8+C6uyWHQ@mail.gmail.com>	 <4D9B9875.60400@gmail.com> <4D9BEDAA.6020400@gentoo.org>	 <BANLkTimNoqZwW=N=5jcMm_C8cTw9ity55g@mail.gmail.com>	 <4D9CC7F0.5080903@gentoo.org> <1302124958.3469.3.camel@freedom2>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1302124958.3469.3.camel@freedom2>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Giuseppe Argentieri <joe.silver@gmail.com>
Cc: Serkan Kaba <serkan@gentoo.org>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>

On 04/06/2011 11:22 PM, Giuseppe Argentieri wrote:
> Il giorno mer, 06/04/2011 alle 23.07 +0300, Serkan Kaba ha scritto:
>
>> This one has a slight issue please use
>> http://bugzilla-attachments.gnome.org/attachment.cgi?id=185354
>>
>> which is actually checking destination not the source.
>> - --
>> Sincerely,
>> Serkan KABA
>> Gentoo Developer
>
> Thank you very much! It seems that this workaround is working!
>
> I will reinstall the original glib as soon as the issue is solved in
> reiser4.


Reiser4 should return error on ->readpages() for small files
built of tail items (fragments). However, I have found that
it takes place only in comments :/

So all applications (including splice), which call readahead
lead to unpredictable results.

I'll try to look through all reiser4 read paths in 1-2 weeks
and make corrections.

Thanks,
Edward.
