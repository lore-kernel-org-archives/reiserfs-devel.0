From: Anders Aagaard <aagaande@gmail.com>
Subject: Re: Reiser4 on dmcrypt
Date: Sat, 16 Aug 2008 10:57:37 +0200
Message-ID: <48A69681.2030304@gmail.com>
References: <48A59695.5030701@gmail.com> <48A5A446.1000106@gmail.com> <48A5F314.8080601@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=zSrX3Rck9if1hMtrOzpekWD7E/6S9jfQmiLt5LFQxUg=;
        b=FyKO12J/+gbEirftCiwtBDyFO2NKbkOwDoutHYjH6IGHQU/80Amz1aK8vUrJf36oVA
         H/mno8YQEXBvEOKxre2EnkC+eURsSZ8UMZMNCP8BYvZTHV5KawHnweKnuYKIXCqs9Q4r
         9JFRcTCsokGY6PrGyjpQNgG4yklUEF34DCr2A=
In-Reply-To: <48A5F314.8080601@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-devel@vger.kernel.org

Anders Aagaard wrote:
> Edward Shishkin wrote:
>> Anders Aagaard wrote:
>>> Hi
>>>
>>> Been trying to move my home directory over to reiser4, and I ran into
>>> some issues, this is what I did:
>>>
>>> PASSCODE="temptest"
>>> echo $PASSCODE | cryptsetup luksFormat /dev/sdf6 -c
>>> twofish-cbc-essiv:sha256 -s 256
>>> echo $PASSCODE | cryptsetup luksOpen /dev/sdf6 tempHome
>>> mkfs.reiser4 -o create=ccreg40,compress=lzo1 /dev/mapper/tempHome
>>>
>>> mount -t reiser4 -o noatime /dev/mapper/tempHome /mnt/x
>>>
>>> rsync -vax --progress /home/neuron/ /mnt/x/
>>>
>>> During rsync I noticed this in top while moving over a virtualbox image:
>>>   PID USER      PR  NI  VIRT  RES  SHR S %CPU %MEM    TIME+  COMMAND
>>>  2427 root      20   0     0    0    0 R  100  0.0  14:32.01 pdflush
>>>  9497 root      20   0     0    0    0 R  100  0.0  11:38.48 rsync
>>>
>>> It did continue, but I figured something was wrong, so I interrupted
>>> the rsync and unmounted.  The rsync reported my copy speed was down to
>>> 3-4mb/sec.  This is on a fairly new quad core, so I should be able to
>>> encrypt and compress the data without difficulty.
>>>
>>
>> Yeah, something goes wrong..
>> Would you please try default (reg40) plugin in the same configuration?
> 
> 
> That does work, although the performance reported by rsync seems very 
> unstable (although that could be a lot of issues), varying between 10 
> and 25mb/sec.  Note that I do not have the patch to enable write 
> barriers on single dm devices, so it's running in "synchronous write", I 
> will try with that patch aswell though.

I just tried with this patch, http://lkml.org/lkml/2008/2/15/125, now
rsync works for quite long before I get the message:
NOTICE: dm-6 does not support write barriers, using synchronous write
instead.

Which to my understanding I shouldn't get?  Rebooted, tested, and it did 
not lock up like it did before.  And
pdflush is around 10-20% on top.

Thought this was a bit odd, so I undid the barrier kernel patch, 
rebooted, and tried again.  And it worked, copied over the file ok, I 
watched dmesg during the copy and realized it said "using synchronous 
write instead" quite late in the copy process, so I thought if I 
repeated the test with the same image it might hang on me.

So I executed rm on Gentoo-Test.vdi, I waited 10-30 seconds, thought 
that was oddly long and started a wall clock, it's been running for 3 
minutes now and it's still not done.

iotop reports this:
   PID USER      DISK READ  DISK WRITE   SWAPIN    IO>    COMMAND
  7327 root        9.52 M/s       0 B/s  0.00 %  0.00 % rm 
/mnt/x/.VirtualBox/V

Top reports this:
   PID USER      PR  NI  VIRT  RES  SHR S %CPU %MEM    TIME+  COMMAND
  6309 root      15  -5     0    0    0 S    9  0.0   0:25.52 kcryptd_io 

  6310 root      15  -5     0    0    0 S    7  0.0   0:39.76 kcryptd
(and 22% iowait).

And as I was typing this it finished, I estimate that rm took about 4-4 
min 30 sec.  File a 6.8gb in size.  Is there really this much to write 
when removing a 6.8gb file?

My test was 100% reproducable on my system before I rebooted, and I 
recreated everything with cryptsetup and mkfs.reiser4 between tests. 
Earlier on the day when I had the problem I had done some performance 
testing on different crypto algorithms + reiser4 on /dev/ram0, and 
particulary cryptsetup wasn't a big fan of that (some errors in dmesg, 
no oops'es or anything I'd think would matter outside the test 
enviroment though).  I'll report back if I can get this to fail.

> 
>>
>> Thanks,
>> Edward.
>>
>>> I remounted and started again, it starts by coping at 14-15mb/sec, and
>>> then just slows down as pdflush hits 100% cpu usage.  Iowait also goes
>>> down to around 5%.  When I interrupt it pdflush disapears instantly,
>>> and rsync sticks around for 10-15 seconds (making it unmountable for
>>> that period) until it dies.
>>>
>>> The file it's having problems with is a 6.8gb virtualbox image I use
>>> as a gentoo test enviroment.
>>>
>>> Anders Aagaard
>>> -- 
>>> To unsubscribe from this list: send the line "unsubscribe
>>> reiserfs-devel" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>
>>
>>
> 
> 


