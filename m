From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [ANNOUNCE] Reiser4: Different Transaction Models
Date: Sat, 18 Oct 2014 22:35:58 +0200
Message-ID: <5442CF2E.3090307@gmail.com>
References: <531E603A.4040709@gmail.com> <CADW=+3mbUUta_hFLecS+7qtoxobfGBVqnVoYESRqNee8Aacwnw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=HnUHZPmqw7QIDWaV+jY4JljLFYm/4D0Axk+dq8CccPc=;
        b=muWAVUqXPdlEsS2yEPSz9urW0WcRV0mjbfoaY4lW2ev+sg7/gE7zPk9dxyPLtQloU7
         VR/DQg2fNeMqq7MJofe9RgQIxQZtFcNjq/zw5cC/SVRTUbDMkk+pa3PUJD1Hal6V912P
         JEy3qjoRc2HcjDL+q39vZrouudhKJKlW9l/pEpCj40OsaKubIa8BL+RnWZXVGLI14cVq
         kuH6+ENyJ98iYeXFrMVmAAi/AxzdmuVmwG2bwR4sbS4k37vZneSn3SHpgBsqL+LIgSaT
         K5RXvsb4PR2AR+wXPuyiYN56YdEdNgVB5Fo3DR2LiV3vqMlofIYUOHc2iJAByZmrDTsT
         E+1A==
In-Reply-To: <CADW=+3mbUUta_hFLecS+7qtoxobfGBVqnVoYESRqNee8Aacwnw@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>
Cc: Ivan Shapovalov <intelfx100@gmail.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>

On 10/18/2014 08:53 PM, Du=C5=A1an =C4=8Coli=C4=87 wrote:
>
> AFAIK other FSes using COW method of allocation don't just mark the=20
> old blocks for discarding but offer a feature of snapshots, they keep=
=20
> the old block that were changed after some snapshot point and they ca=
n=20
> easily transfer through multiple snapshots.
> To implement snapshots in R4 would this have to be done or something =
more:
> 1. Change allocator logic to mark every changed block not dirty but=20
> with last snapshot identifier. If there's no last snapshot mark it=20
> dirty. If snapshot is deleted delete its blocks if there aren't any=20
> younger snapshots referencing that data;
> 2. Make interface (sys?) to show and manipulate (create, make active,=
=20
> delete, show status) snapshot points.
>


I've worked out this ~6 months ago..
 From my standpoint, the feature of snapshots includes the following=20
notions:

1. Chronology is a set H of linearly ordered elements (called=20
times-tamps) with
the following operations:
H.create timestamp() =E2=80=94 create a new timestamp, add it to H and =
return it;
H.remove timestamp() =E2=80=94 remove a specified timestamp from H;
H.list() =E2=80=94 return a list of all timestamps of H.
and the following property: every new timestamp added by H.create=20
timestamp() is the
largest element of H at the moment of addition.

2. A (simple) file system volume C is said to possess a feature of (loc=
al)
snapshots, iff C, in addition, possesses the following parameters and=20
virtual methods:
C.init_snapshots() =E2=80=94 create a timestamp in the local chronology=
 to refer=20
the initial
"version" of the volume. Return this timestamp;
C.create_snapshot() =E2=80=94 create a shapshot of C, store it, and ret=
urn a=20
unique times-
tamp of the snapshot in the local chronology of C;
C.restore_snapshot() =E2=80=94 deploy a specified snapshot of C;
C.delete_snapshot() =E2=80=94 delete a specified snapshot of C.


> 3. Snapshot points could eventually have some treelike structure and=20
> get pretty complex but there had to be made some way to calculate=20
> space occupied by every snapshot.
>


=46irst, we should decide what technique we'll choose for our snapshots=
=2E

Assume, that this is a fashionable technique of reference counters (lik=
e in
ZFS, etc). If so, than we'll need to use the write-anywhere transaction
model (txmod=3Dwa), because overwrites (txmod=3Djournal) will spoil our
snapshots.

Next, we'll need to adjust the technique if lazy reference counters=20
(invented
by Ohad Rodeh) to the bottom-top process of the storage tree balancing.

With the upgraded algorithmic base I suggest to implement the read-only
snapshots of simple reiser4 volumes. Once it works, we can easily imple=
ment
writable and super-writable snapshots.

Read-only snapshots will require to maintain a list (array) of storage=20
tree roots
(AKA chronology defined above). Also we'll need a new format of tree no=
des
(node41), which includes the reference counter (8 bytes).

Basically, that's all..


> Is this all possible without disk format change?
>


You don't need to worry about this.
We have worked out the backward compatible development model for Reiser=
4.
(format 4.X.Y will be released).

Edward.
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
