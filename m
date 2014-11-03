From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4 for 3.16.2 problem: mount: mount /dev/md125 on /mnt/backup
 failed: Cannot allocate memory
Date: Mon, 03 Nov 2014 16:42:58 +0100
Message-ID: <5457A282.7020704@gmail.com>
References: <CADW=+3nWaMdFCpoKQSErTQPu7YHm=4UJEZfZFnn8wOKX9tKrKg@mail.gmail.com> <CADW=+3ms6zaqzpkRBEgApi=gkMNPLCzzex8ShK4CkCFD-WNk8Q@mail.gmail.com> <5457629C.8040906@gmail.com> <CADW=+3=XfcVJsYTitCHdAsehw61Vyk0vHqM7wLr0dQNLiP94Fw@mail.gmail.com> <54576A09.6010901@gmail.com> <CADW=+3k0rgockXeT_mnPFSoRr0Xm4ttRG5ZVpPjd3DqWCNL6gw@mail.gmail.com> <CADW=+3nzgJaYqAav475to7W4G4q6CoRMq83y-oNOOFLdU6xdSg@mail.gmail.com> <CADW=+3n1042QZJO=Eyd1ePc1xZyS+bsYPup5s2vSk81_6JCO3g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=jHsZOg8fp0rWSJZdEHBIQ0h/L5dF8gyiZpJ+S2l88Rk=;
        b=MyYKdMpRSESn85GA1M0l3EAMp5x8caZ1CTP5rSUmTEVeTqA1yDwPBwlZpn2qWBpvK9
         GrTy7SDugPb2X/aoihEHjL/YA6l/CGV/HUe4+zq/xiHmcZhNs/AC3ME5Zw3Dt9ngSGtM
         YftZAgt9rrmqYzAZ53TcZRFStjqx3V6EgI88n07Ypl6/lHaYong/odJCfP9rd5fhWrjR
         HzD65ESuzDTkNbYwfdr7CxQ/+ISAfvkoj6r0Eswjk0FSX/1wIHykrhK+2/tswD9MGUVD
         X+HyMjyHKu2cxkkI7ZbG4Ph0rqdLP0awNpBFW6cs9qs0jAkp2R1uiJS3HffYUhCTSO36
         wzHg==
In-Reply-To: <CADW=+3n1042QZJO=Eyd1ePc1xZyS+bsYPup5s2vSk81_6JCO3g@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>, Ivan Shapovalov <intelfx100@gmail.com>

On 11/03/2014 02:33 PM, Du=C5=A1an =C4=8Coli=C4=87 wrote:
> I forgot:
> It was working for some time (deleting old directories etc.) and then=
 crashed.
> Btw. why didn't that partition (/dev/md125) remounted read-only on
> error when I have that in /etc/fstab?


What do you suggest to do when encountering IO error?
There is another option: to oops. You like this better?

Edward.


>
> On Mon, Nov 3, 2014 at 2:28 PM, Du=C5=A1an =C4=8Coli=C4=87 <dusanc@gm=
ail.com> wrote:
>> After an hour or more still nothing, one rsync went to zombie other
>> still in D state
>> I killed the main process and rebooted.
>>
>> krshina3 goran # ps -aux | grep rsync
>> root      6655  0.0  0.1 101568  9328 pts/4    D    13:08   0:01
>> /usr/bin/rsync -ax --delete --numeric-ids --relative --delete-exclud=
ed
>> --exclude=3D/home/windows.qcow2
>> --link-dest=3D/mnt/backup/daily.1/localhost/ /home
>> /mnt/backup/daily.0/localhost/
>> root      6656  0.0  0.0      0     0 pts/4    Z    13:08   0:00
>> [rsync] <defunct>
>>
>>
>> Now I tried same command (rsnapshot -c /etc/rsnapshot.d/daily.conf
>> daily) and kernel BUGed with:
>>
>> krshina3 goran # rsnapshot -c /etc/rsnapshot.d/daily.conf daily
>> rsync: writefd_unbuffered failed to write 5 bytes to socket
>> [generator]: Broken pipe (32)
>> --------------------------------------------------------------------=
--------
>> rsnapshot encountered an error! The program was invoked with these o=
ptions:
>> /usr/bin/rsnapshot -c /etc/rsnapshot.d/daily.conf daily
>> --------------------------------------------------------------------=
--------
>> ERROR: /usr/bin/rsync returned 0.04296875 while processing /home/
>> WARNING: Rolling back "localhost/"
>> rsync error: error in rsync protocol data stream (code 12) at
>> io.c(1532) [generator=3D3.0.9]
>>

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
