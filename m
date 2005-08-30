From: Marc Perkel <marc@perkel.com>
Subject: Re: WinFS beta out
Date: Tue, 30 Aug 2005 08:45:02 -0700
Message-ID: <43147EFE.2020804@perkel.com>
References: <e692861c0508292136543a02e1@mail.gmail.com> <1125380557.9589.3.camel@gentoo> <4313FE21.8080709@namesys.com> <019d01c5ad68$4d5fdfa0$d60310ac@homedom>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25729-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <019d01c5ad68$4d5fdfa0$d60310ac@homedom>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Reiserfs List <reiserfs-list@namesys.com>

One think to remember when comparing different file systems is not just 
speed but functionality. Windows has a far better permission system than 
Linux does. ACLs bring Linux closer to Windows when it cones to fine 
grained permissions, but when you turn ACLs on with reiser 3 it slows 
down to 1/10 of normal speed and Reiser 4 ACLs just doesn't work. With 
ACLs as part of the mix ReiserFS would get its butt kicked.

Welcome to the real world.

