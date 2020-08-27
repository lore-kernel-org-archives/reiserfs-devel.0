From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [ANNOUNCE] Reiser5: Selective File Migration - User Interface
Date: Fri, 28 Aug 2020 01:50:29 +0200
Message-ID: <62dc962d-1dfd-641d-08ca-4abf62b50917@gmail.com>
References: <20200827215351.620A468F3402@huitzilopochtli.metztli-it.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=/iHX8oGR/qHNguoGaFGrBXIYpiYEp0r+O9Pxal1CvIs=;
        b=I5UV8cFx9ujIWThpozl3aeYobfe7itCA8dgDcxCXcFA8+sa5SXT6A+BvxLsOBpCWfG
         JFTXBd5xixrKQDpEwc91se/fOtQPIPfLrgzNy8KgjmaoiYmgsaPnK43NqHuQhQqLDKDJ
         mYV6QJUPJTIY1lyIDJBUKJUUR8SgaTtYrcv3vkjRf0PoJX0SElRESKpqU6XXRKTh83um
         Ue8EfJHo1jYzB9m3sLA+ylMUlq/6cvmVVZW+ShqFD02NBsOeND2YyKWBcMwOZFCMnRGZ
         3U8rI03xSaa9V5hmw9GmN2DhrcFNpH4ki4wr/uz7HAWEa4MvgvmCF+5zjhbqfXysPkIu
         wewA==
In-Reply-To: <20200827215351.620A468F3402@huitzilopochtli.metztli-it.com>
Content-Language: en-US
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Metztli Information Technology <jose.r.r@metztli.com>, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org



On 08/27/2020 11:53 PM, Metztli Information Technology wrote:
> On Wed, Aug 26, 2020 at 2:13 PM Edward Shishkin <edward.shishkin@gmail.com> wrote:
>>
>> [...]
>>
>>>
>>> FYI Although not officially, the Debian metaframework Buster AMD64 distribution might be the first to support native installation of Reiser4 SFRN 5.1.3, kernel and reiser4progs 2.0.3, file system utilities.
>>>
>>> I have already made a couple of successful Metztli Reiser4 SFRN 5 native installations onto ~100 GB slices, which root file system is formatted in 'Reiser5' and 1 GB /boot in JFS.
>>> https://metztli.it/reiser5 (Screenshot 600x338 size)
>>>
>>> The upgraded netboot installation media metztli-reiser4-sfrn5.iso is available at:
>>> https://sourceforge.net/projects/debian-reiser4/
>>> as well as
>>> https://metztli.it/buster-reiser5/metztli-reiser4-sfrn5.iso
>>> https://metztli.it/buster-reiser5/metztli-reiser4-sfrn5.iso.SHA256SUM
>>>
>>> Likely the brick/volume feature(s) will be useful in Cloud fabric infrastructures, like Google's, where reiser4 excels.
>>>
>>> The current SFRN 5.1.3 -patched Zstd -compressed kernel in the installation media is Debian's 5.7.10.
>>
>>
>> wow, reiser5 from the box? I might want to try..
> Well, it is more of a 'reference implementation' as there are persons who reached out to me because their builds succeeded, they were able to format in reiser4 SFRN x.y.z, but they were not able to mount their partition(s).
> Turns out, they were inadvertently mixing SFRN 4.0.2 with 5.1.3, either in the reiser4 kernel patch -- released with the same in both instances -- or in the reiser4progs.


Yeah, some confusion can take place. Plus unsupported old 4.0.2
volumes (a special build with CONFIG_REISER4_OLD=y is required to
mount them), which is a payment for performance.


> 
>>
>>>
>>> The installer defaults to create the root system reiser5 -formatted partition as:
>>> mkfs.reiser4 -yo "create=reg42"
>>
>>
>> "reg42" is default profile in reiser4progs-2.0.3 (check by
>> "mkfs.reiser4 -p") - there is no need to specify it via option.
> Acknowledged. Thanks.
> 
>>
>> Have you had a chance to play with logical volumes (add/remove
>> bricks, etc)?
> That is coming up. I still have to create/customize an image of Metztli Reiser4 SFRN5 for a Google Compute Engine (GCE) minimal ~200GB instance for evaluation.
> Fact is 'not all clouds are created equal' -- even if KVM -based. For instance, reiser4 SFRN 4.0.2 on a trial Linode small ~80GB SSD slice(s) with 2 virtual cpus frequently hung under short sustained disk/network I/O usage.
> I have not experienced that with reiser4 SFRN 4.0.2 on GCE -- where sometimes I allocate eight to sixteen virtual cpus with 16, 32, or even 64, GBs of RAM, on a region hosting AMD Epyc, for fast kernel building ops.
> 
> But testing a relatively small bootable image first will usually provide insight if adding one, two... eight, TB slices will make sense later on.


I played with your media on a virtual machine. The basic volume
operations work, however, I guess, adding brick(s) to "/" will cause
problems at next boot: someone has to register all the bricks before
mounting "/"...

It seems that we need to maintain a kind of volume configuration (at
/etc/reiser4, or so) to automate that process. Unfortunately, I am
currently busy with making things stable. If anyone could take a look
at this, I would be appreciated.

Thanks,
Edward.
