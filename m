From: <doiggl@velocitynet.com.au>
Subject: Re: Reiser4 for 3.16.2 problem: mount: mount /dev/md125 on /mnt/backup failed: Cannot allocate memory
Date: Wed, 10 Dec 2014 20:46:20 +1100
Message-ID: <20141210095309.892CC600CE@mail.velocitynet.com.au>
References: <CADW=+3nWaMdFCpoKQSErTQPu7YHm=4UJEZfZFnn8wOKX9tKrKg@mail.gmail.com> <54576A09.6010901@gmail.com> <CADW=+3k0rgockXeT_mnPFSoRr0Xm4ttRG5ZVpPjd3DqWCNL6gw@mail.gmail.com> <CADW=+3nzgJaYqAav475to7W4G4q6CoRMq83y-oNOOFLdU6xdSg@mail.gmail.com> <CADW=+3n1042QZJO=Eyd1ePc1xZyS+bsYPup5s2vSk81_6JCO3g@mail.gmail.com> <5457A282.7020704@gmail.com> <CADW=+3mzX7evaqZmvOSJ6F9XNmzmauegL4Vy0nqz6yqG8EyLyw@mail.gmail.com> <5457B0AB.6030203@gmail.com> <CADW=+3nSsTDABn4bWy0g8LVGmx4iJJ8YvdYuS2eokpi4RwdepQ@mail.gmail.com> <5458CB45.2050303@gmail.com> <CADW=+3k7mvPTc0x02UKYbg6Jq=zUQ5dORiUULNiB7kFLXjiG6g@mail.gmail.com> <545965C7.5010304@gmail.com> <CADW=+3k40KVKf5hLD1BgJ8a6uj=ZJ=T_gOmijDZVxWS3pK_6AQ@mail.gmail.com> <54665EFD.7030304@gmail.com> <CADW=+3mrqv=BjX8TCpRszFbr3OYEvgOk0OpcYe56f6OJmYDZbQ@mail.gmai
 l.com> <CADW=+3m75JHiu2fWHJ5mq0Q4XUd2vkp5An1mKsOPkd8OWQnz+w@mail.gmail.com> <547BACC8.6090805@gmail.com> <CADW=+3=Tqw-2yfe6q4ERKSdyu9BmbApoREi-p4A7Auu_k27A6Q@mail.gmail.com> <547BAF3D.100060
 5@gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <CADW=+3kpg6zYxNWwX5tN0AWZ8Cuof0ccVRsQaL-6knM5AmOhbg@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

<CADW=+3=GpYCc3aQOexJY7afL6suKxXRhs=dkf0m9zZfHQ0cnFA@mail.gmail.com> <CADW=+3kpg6zYxNWwX5tN0AWZ8Cuof0ccVRsQaL-6knM5AmOhbg@mail.gmail.com>
Message-ID: <19cc0a2ad9f331ee56016e24dbeb6883@mail.velocitynet.com.au>
X-Sender: doiggl@velocitynet.com.au
User-Agent: RoundCube Webmail/0.3.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=UTF-8

Hello,
Something is eating up ram.

Yours reads:
# cat /proc/meminfo
MemTotal:        7867900 kB
MemFree:         1553044 kB
MemAvailable:    4853752 kB
Buffers:               0 kB
Cached:          2975880 kB

Mine reads:
#cat /proc/meminfo
MemTotal:        7932564 kB
MemFree:         5352992 kB
Buffers:           86092 kB
Cached:          1778548 kB

I have no r4 partitions mounted.
I have 8 GB ram installed

- What does your /proc/meminfo say  before using fsck.reiser4 /dev/md125
command ?

- What does your /proc/meminfo say  before and after using fsck.reiser4
/dev/md125 command using on 3.10 kernel ?
--Glenn
