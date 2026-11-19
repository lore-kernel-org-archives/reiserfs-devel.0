Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.208.129.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795130734;
	b=Ik9XXUe0MmIoGQ12Vbenl5JVlc13XTM/MCuoyQpa1hlRr9mkfLs5W8E+WVs3UNvB8obD
	 nB/6fhkVkKIJsURIGtSqpz63bzMOplMQ70ZLO8E7FRTqIYvoApQs+xt9Nqo+CptnzGc75
	 Rqb0kJN0dgXKBR/iv8lEXCe7CU3+U2RNCDBZ1820De3diMZuS5e6nY2CSkw1y57f6IIo0
	 /hHZS9j1HL5xSXc9Tfff4zGAv5kp0nXdqOHJcrAwtUDnqsfkoRpptMVIRFJ5TSeH+X4j9
	 6LTSLoyw7DGTDCCjD8oZClOgklZjuChRjLDMQ1yVSyeqwVsmndK5NqK7IlMhB9Ona8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795130734;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 User-Agent:Message-ID:X-Sender:Organization:Content-Type;
	bh=HgcT9v35eMzqtRxtOgGBduRg8IF71bcmcr1i1/mjo6U=;
	b=VQ9rpwxI9jVntWeJ95EUqD3zieXU02HqcBVtkGkR5C+6Z6KHC4JZBfdU7eRfYRrWCHJz
	 NJBhXGzA3NZlm8p6nlxk7YNy+rL7YnxWVK7BANtziWpBYlNERfD+01qHNrTHHc1BxvNrw
	 8dvruAAsUiaEL3PWYQDXjJRUoBc4pBeDNyStB4pyPYEahn1ycOKjcR/uX9MtqsDe4KZdk
	 FxhGbhSedy5LdfIqqANC41St19jK6MZ7pOWRJCwodK7/81YMSPa1+/LLrJ8lOoX9WeHwa
	 XqT41mGoC8uRoYzkd3cGv8h8kOeyQLfKArsvD6RI1WS68HAzao9pfGmLrAd6b/3WEpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=metztli.com;
	spf=pass smtp.mailfrom=metztli.com;
	dkim=pass header.d=metztli.com header.i=@metztli.com header.a=rsa-sha256 header.s=dkim header.b=klltzGeD;
	arc=none smtp.remote-ip=74.208.129.35
Received: from payinal.metztli.com (payinal.metztli.com [74.208.129.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475BF606A320
	for <reiserfs-devel@vger.kernel.org>; Thu, 19 Nov 2026 23:25:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 475BF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=metztli.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=metztli.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=metztli.com header.i=@metztli.com header.a=rsa-sha256 header.s=dkim header.b=klltzGeD
Received: from payinal.metztli.com (localhost [127.0.0.1])
	by payinal.metztli.com (Postfix) with ESMTP id 4jVvhk2rpfzdwvH
	for <reiserfs-devel@vger.kernel.org>; Thu, 19 Nov 2026 15:25:26 -0800 (PST)
Authentication-Results: payinal.metztli.com (amavis); dkim=pass (2048-bit key)
 reason="pass (just generated, assumed good)" header.d=metztli.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=metztli.com; h=
	content-type:organization:message-id:user-agent:references
	:in-reply-to:subject:to:from:date:mime-version; s=dkim; t=
	1795130725; x=1797722726; bh=fiLliMV5F3WAzGOkPu3IrjcUE3rrvYiaxKD
	KDXlpPBY=; b=klltzGeDLUFUVbh/jr2PLsZBGZhcenCog6oOH8Q4L+xxFwgAXUr
	aYlYMtfGnJnzyjK+5EFcKJE5jC0hElwIlA6wzQgZoZFM+R+TabRnSpeZJ1qUSqAv
	P+q1AsW4Xsn8025IVoLbNfs8A0qd25vnhJ0MHiBCdEZLoEA5OeX9TtWl8Ev9xLAv
	y/D3KF9dCqy0hiFvhh2ga5b5NKkhomQdzsgj8JdxPqS2z98btml2Bxk4BT5/2F6n
	EvgMCjs3ili0+d7f3Dli1Eahy1ShELPkxBOjjnwaawzLz3OWRgpR7LDzSDYfbjzO
	12h+M+CKuL/pzyHPYTHLyjMxJDaQPpTviAg==
X-Virus-Scanned: Debian amavis at payinal.metztli.com
Received: from payinal.metztli.com ([127.0.0.1])
 by payinal.metztli.com (payinal.metztli.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id FWag4v49vjdg for <reiserfs-devel@vger.kernel.org>;
 Thu, 19 Nov 2026 15:25:25 -0800 (PST)
Received: from metztli.com (localhost [127.0.0.1])
	by payinal.metztli.com (Postfix) with ESMTPSA id 4jVvhj24Rbzdwtf;
	Thu, 19 Nov 2026 15:25:25 -0800 (PST)
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Post: <mailto:reiserfs-devel@vger.kernel.org>
List-Help: <mailto:reiserfs-devel+help@vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:reiserfs-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Thu, 19 Nov 2026 15:25:25 -0800
From: Jose R Rodriguez <jose.r.r@metztli.com>
To: Greg KH <greg@kroah.com>
Cc: oss-security@lists.openwall.com, Edward Shishkin
 <edward.shishkin@gmail.com>, Reiserfs Devel <reiserfs-devel@vger.kernel.org>
Subject: =?UTF-8?Q?NoisyTCP_=E2=80=94_CVE-2026-99288_=28Was_Re=3A_=5Boss-?=
 =?UTF-8?Q?security=5D_Backports_available_-_cBPF_JIT_spray_hardening=29?=
In-Reply-To: <2026073004-spruce-clambake-1785@gregkh>
References: <dzp2vbih7jcsxjmcnxnefgi435b7re4kwxvxmvlxrmkra2p5br@vv5ckstkijym>
 <14ad9b085cb3fb4b3a9fc091dde74540@metztli.com>
 <6mqqzqzujeduybqeojfh7tmblksmqjksocri5ayeudze6l4fqm@ijx64jfxrwbt>
 <2026073004-spruce-clambake-1785@gregkh>
User-Agent: Roundcube Webmail
Message-ID: <49ce58fc228f99240f9c3658622ca2d6@metztli.com>
X-Sender: jose.r.r@metztli.com
Organization: Metztli IT
Content-Type: multipart/mixed;
 boundary="=_6112c175a58b79979067ab7b28da7523"

--=_6112c175a58b79979067ab7b28da7523
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: quoted-printable

On 2026-07-30 07:00, Greg KH wrote:
> On Wed, Jul 29, 2026 at 06:31:11PM -0700, Pawan Gupta wrote:
>> On Wed, Jul 29, 2026 at 05:15:46PM -0700, Jose R Rodriguez wrote:
>> > On 2026-07-29 13:04, Pawan Gupta wrote:
>> > > Hi All,
>> > >
>> > > This is an inform distro maintainers about recently upstreamed har=
dening
>> > > against speculative execution attacks using BPF JIT spraying.
>> > >
>> > > The backports are available here:
>> > >
>> > >   6.1  - https://lore.kernel.org/all/20260727-cbpf-jit-spray-harde=
ning-6-1-y-v1-0-eb80dcf1eb6e@linux.intel.com
>> > >   6.6  - https://lore.kernel.org/all/20260717-cbpf-jit-spray-harde=
ning-6-6-y-v1-0-e04f1b2893de@linux.intel.com
>> > >   6.12 - https://lore.kernel.org/all/20260715-cbpf-jit-spray-harde=
ning-6-12-y-v1-0-d8585a9aed80@linux.intel.com
>> > >   6.18 - https://lore.kernel.org/all/20260713-cbpf-jit-spray-harde=
ning-6-18-y-v1-0-755f60c55705@linux.intel.com
>> > >   7.1  - https://lore.kernel.org/all/20260709-cbpf-jit-spray-harde=
ning-7-1-y-v1-0-5ac5a2d6797f@linux.intel.com
>> > >
>> > > 6.1 backport is queued. Others are part of LTS kernels.
>> > >
>> > > 5.15 and older do not support pack allocator for BPF on which the
>> > > hardening
>> > > is based on. So the series is not directly applicable to 5.15 and =
older,
>> > > and may need custom hardening patches.
>> >
>> > Any patches out there for kernel 5.17.15? Thanks in advance!
>>=20
>> Pack allocator was first introduced in 5.18 by commit:
>>=20
>>   57631054fae6 ("bpf: Introduce bpf_prog_pack allocator")
>>=20
>> This means that 5.17 is in the same boat as 5.15, it does not support=20
>> BPF
>> pack allocator, and these hardening patches dont apply.
>>=20
>> Pack allocator makes the JIT spraying attacks easier, but this doesn't=
=20
>> mean
>> that kernels withouth it are immune to such attacks. This needs a=20
>> fresh
>> assessment and possibly a different hardening approach.
>>=20
>> BTW, I am confused by the choice of distro kernel 5.17 which is not an=
=20
>> LTS
>> kernel.
>=20
> Yes, that's a very odd choice for anyone to run these days.  According
> to the cve tools:
> 	Total Vulnerable CVE's in 5.17.15 : 7035
>=20
> That's a non-trivial amount...

Since the time of your comment I have been keeping up with reiser4=20
-enhanced 5.15 LTS build iterations -- with the latest being 5.15.224.=20
Notwithstanding, 'NoisyTCP =E2=80=94 CVE-2026-99288' came along and the l=
atest=20
5.15.225 LTS iteration did not address the critical vulnerability. I=20
have the 5.15 LTS kernel(s) deployed online and I got spooked.=20
Accordingly, on a best effort basis, I backported the patch from=20
upstream:

 From 0e5944a7abe777d2b8aad3604f7a7531966c06b1 Mon Sep 17 00:00:00 2001
 From: Metztli Information Technology <jose@moiocoiatzin.metztli.it>
Date: Thu, 19 Nov 2026 14:45:54 -0800
Subject: [PATCH]=20
=3D?UTF-8?q?Best=3D20effort=3D205.15.225=3D20LTS=3D20backport=3D20pat?=3D
  =3D?UTF-8?q?ch=3D20against=3D20NoisyTCP=3D20=3DE2=3D80=3D94=3D20CVE-202=
6-99288?=3D
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

---
  include/linux/refcount.h        | 55 +++++++++++++++++++++++++++++++++
  net/core/filter.c               |  2 +-
  net/ipv4/inet_connection_sock.c | 16 ++++++----
  net/ipv4/inet_hashtables.c      |  7 +++--
  net/ipv4/inet_timewait_sock.c   |  4 +--
  net/ipv4/syncookies.c           |  4 ++-
  net/ipv4/tcp_fastopen.c         |  2 +-
  net/ipv4/tcp_input.c            |  4 ++-
  net/ipv6/inet6_hashtables.c     |  6 ++--
  9 files changed, 83 insertions(+), 17 deletions(-)

diff --git a/include/linux/refcount.h b/include/linux/refcount.h
index b8a6e387f8f9..43a29f15d09c 100644
--- a/include/linux/refcount.h
+++ b/include/linux/refcount.h
@@ -142,6 +142,10 @@ static inline void refcount_set(refcount_t *r, int=20
n)
   *
   * Return: the refcount's value
   */
+static inline void refcount_set_release(refcount_t *r, int n)
+{
+	atomic_set_release(&r->refs, n);
+}
  static inline unsigned int refcount_read(const refcount_t *r)
  {
  	return atomic_read(&r->refs);
@@ -188,6 +192,48 @@ static inline __must_check bool=20
refcount_add_not_zero(int i, refcount_t *r)
  	return __refcount_add_not_zero(i, r, NULL);
  }

+static inline __must_check
+bool __refcount_add_not_zero_limited_acquire(int i, refcount_t *r, int=20
*oldp,
+					     int limit)
+{
+	int old =3D refcount_read(r);
+
+	do {
+		if (!old)
+			break;
+
+		if (i > limit - old) {
+			if (oldp)
+				*oldp =3D old;
+			return false;
+		}
+	} while (!atomic_try_cmpxchg_acquire(&r->refs, &old, old + i));
+
+	if (oldp)
+		*oldp =3D old;
+
+	if (unlikely(old < 0 || old + i < 0))
+		refcount_warn_saturate(r, REFCOUNT_ADD_NOT_ZERO_OVF);
+
+	return old;
+}
+
+static inline __must_check bool
+__refcount_inc_not_zero_limited_acquire(refcount_t *r, int *oldp, int=20
limit)
+{
+	return __refcount_add_not_zero_limited_acquire(1, r, oldp, limit);
+}
+
+static inline __must_check
+bool __refcount_add_not_zero_acquire(int i, refcount_t *r, int *oldp)
+{
+	return __refcount_add_not_zero_limited_acquire(i, r, oldp, INT_MAX);
+}
+static inline __must_check bool refcount_add_not_zero_acquire(int i,=20
refcount_t *r)
+{
+	return __refcount_add_not_zero_acquire(i, r, NULL);
+}
+
  static inline void __refcount_add(int i, refcount_t *r, int *oldp)
  {
  	int old =3D atomic_fetch_add_relaxed(i, &r->refs);
@@ -245,6 +291,15 @@ static inline __must_check bool=20
refcount_inc_not_zero(refcount_t *r)
  	return __refcount_inc_not_zero(r, NULL);
  }

+static inline __must_check bool=20
__refcount_inc_not_zero_acquire(refcount_t *r, int *oldp)
+{
+	return __refcount_add_not_zero_acquire(1, r, oldp);
+}
+static inline __must_check bool=20
refcount_inc_not_zero_acquire(refcount_t *r)
+{
+	return __refcount_inc_not_zero_acquire(r, NULL);
+}
+
  static inline void __refcount_inc(refcount_t *r, int *oldp)
  {
  	__refcount_add(1, r, oldp);
diff --git a/net/core/filter.c b/net/core/filter.c
index f4a6ca23eef5..8de20ec6c5f0 100644
--- a/net/core/filter.c
+++ b/net/core/filter.c
@@ -7197,7 +7197,7 @@ BPF_CALL_3(bpf_sk_assign, struct sk_buff *, skb,=20
struct sock *, sk, u64, flags)
  	if (sk_unhashed(sk))
  		return -EOPNOTSUPP;
  	if (sk_is_refcounted(sk) &&
-	    unlikely(!refcount_inc_not_zero(&sk->sk_refcnt)))
+	    unlikely(!refcount_inc_not_zero_acquire(&sk->sk_refcnt)))
  		return -ENOENT;

  	skb_orphan(skb);
diff --git a/net/ipv4/inet_connection_sock.c=20
b/net/ipv4/inet_connection_sock.c
index ac9f18861aa7..3681198e43d9 100644
--- a/net/ipv4/inet_connection_sock.c
+++ b/net/ipv4/inet_connection_sock.c
@@ -863,8 +863,8 @@ static void reqsk_timer_handler(struct timer_list=20
*t)
  		 * hold another count to prevent use-after-free and
  		 * call reqsk_put() just before return.
  		 */
-		refcount_set(&nreq->rsk_refcnt, 2 + 1);
  		timer_setup(&nreq->rsk_timer, reqsk_timer_handler, TIMER_PINNED);
+		refcount_set_release(&nreq->rsk_refcnt, 2 + 1);
  		reqsk_queue_migrated(&inet_csk(nsk)->icsk_accept_queue, req);

  		req =3D nreq;
@@ -939,10 +939,14 @@ static void reqsk_timer_handler(struct timer_list=20
*t)
  	 */
  	if (nreq) {
  		__NET_INC_STATS(net, LINUX_MIB_TCPMIGRATEREQFAILURE);
+		/* The timer was not armed, drop its reference here. */
+		reqsk_put(nreq);
  no_ownership:
  		reqsk_migrate_reset(nreq);
  		reqsk_queue_removed(queue, nreq);
-		__reqsk_free(nreq);
+		/* Drop the temporary reference and the one reserved for ehash. */
+		reqsk_put(nreq);
+		reqsk_put(nreq);
  	}

  drop:
@@ -1216,7 +1220,7 @@ struct sock *inet_csk_complete_hashdance(struct=20
sock *sk, struct sock *child,
  				goto child_put;
  			}

-			refcount_set(&nreq->rsk_refcnt, 1);
+			refcount_set_release(&nreq->rsk_refcnt, 1);
  			if (inet_csk_reqsk_queue_add(sk, nreq, child)) {
  				__NET_INC_STATS(sock_net(sk), LINUX_MIB_TCPMIGRATEREQSUCCESS);
  				reqsk_migrate_reset(req);
@@ -1226,7 +1230,7 @@ struct sock *inet_csk_complete_hashdance(struct=20
sock *sk, struct sock *child,

  			__NET_INC_STATS(sock_net(sk), LINUX_MIB_TCPMIGRATEREQFAILURE);
  			reqsk_migrate_reset(nreq);
-			__reqsk_free(nreq);
+			reqsk_put(nreq);
  		} else if (inet_csk_reqsk_queue_add(sk, req, child)) {
  			return child;
  		}
@@ -1270,7 +1274,7 @@ void inet_csk_listen_stop(struct sock *sk)
  		if (nsk) {
  			nreq =3D inet_reqsk_clone(req, nsk);
  			if (nreq) {
-				refcount_set(&nreq->rsk_refcnt, 1);
+				refcount_set_release(&nreq->rsk_refcnt, 1);

  				rcu_read_lock();
  				if (inet_csk_reqsk_queue_add(nsk, nreq, child)) {
@@ -1282,7 +1286,7 @@ void inet_csk_listen_stop(struct sock *sk)
  					__NET_INC_STATS(sock_net(nsk),
  							LINUX_MIB_TCPMIGRATEREQFAILURE);
  					reqsk_migrate_reset(nreq);
-					__reqsk_free(nreq);
+					reqsk_put(nreq);
  				}
  				rcu_read_unlock();

diff --git a/net/ipv4/inet_hashtables.c b/net/ipv4/inet_hashtables.c
index a7d11b82fe64..dc7ab92c8978 100644
--- a/net/ipv4/inet_hashtables.c
+++ b/net/ipv4/inet_hashtables.c
@@ -381,10 +381,11 @@ struct sock *__inet_lookup_established(struct net=20
*net,
  		if (sk->sk_hash !=3D hash)
  			continue;
  		if (likely(INET_MATCH(net, sk, acookie, ports, dif, sdif))) {
-			if (unlikely(!refcount_inc_not_zero(&sk->sk_refcnt)))
+			if (unlikely(!refcount_inc_not_zero_acquire(&sk->sk_refcnt)))
  				goto out;
-			if (unlikely(!INET_MATCH(net, sk, acookie,
-						 ports, dif, sdif))) {
+			if (unlikely(hlist_nulls_unhashed_lockless(&sk->sk_nulls_node) ||
+				     !INET_MATCH(net, sk, acookie, ports, dif,
+						 sdif))) {
  				sock_gen_put(sk);
  				goto begin;
  			}
diff --git a/net/ipv4/inet_timewait_sock.c=20
b/net/ipv4/inet_timewait_sock.c
index 25809e06f111..aae056089157 100644
--- a/net/ipv4/inet_timewait_sock.c
+++ b/net/ipv4/inet_timewait_sock.c
@@ -137,7 +137,7 @@ void inet_twsk_hashdance(struct inet_timewait_sock=20
*tw, struct sock *sk,
  	 * Also note that after this point, we lost our implicit reference
  	 * so we are not allowed to use tw anymore.
  	 */
-	refcount_set(&tw->tw_refcnt, 3);
+	refcount_set_release(&tw->tw_refcnt, 3);
  }
  EXPORT_SYMBOL_GPL(inet_twsk_hashdance);

@@ -278,7 +278,7 @@ void inet_twsk_purge(struct inet_hashinfo *hashinfo,=20
int family)
  			    refcount_read(&sock_net(sk)->ns.count))
  				continue;

-			if (unlikely(!refcount_inc_not_zero(&sk->sk_refcnt)))
+			if (unlikely(!refcount_inc_not_zero_acquire(&sk->sk_refcnt)))
  				continue;

  			if (unlikely(sk->sk_family !=3D family ||
diff --git a/net/ipv4/syncookies.c b/net/ipv4/syncookies.c
index 5a61f9a364ad..ee39ec6452e3 100644
--- a/net/ipv4/syncookies.c
+++ b/net/ipv4/syncookies.c
@@ -203,7 +203,7 @@ struct sock *tcp_get_cookie_sock(struct sock *sk,=20
struct sk_buff *skb,
  	child =3D icsk->icsk_af_ops->syn_recv_sock(sk, skb, req, dst,
  						 NULL, &own_req, NULL);
  	if (child) {
-		refcount_set(&req->rsk_refcnt, 1);
+		refcount_set_release(&req->rsk_refcnt, 1);
  		tcp_sk(child)->tsoffset =3D tsoff;
  		sock_rps_save_rxhash(child, skb);

@@ -217,6 +217,8 @@ struct sock *tcp_get_cookie_sock(struct sock *sk,=20
struct sk_buff *skb,

  		bh_unlock_sock(child);
  		sock_put(child);
+		reqsk_put(req);
+		return NULL;
  	}
  	__reqsk_free(req);

diff --git a/net/ipv4/tcp_fastopen.c b/net/ipv4/tcp_fastopen.c
index f3ed7d5ff7ef..ffa975ceb946 100644
--- a/net/ipv4/tcp_fastopen.c
+++ b/net/ipv4/tcp_fastopen.c
@@ -281,7 +281,7 @@ static struct sock *tcp_fastopen_create_child(struct=20
sock *sk,
  	inet_csk_reset_xmit_timer(child, ICSK_TIME_RETRANS,
  				  TCP_TIMEOUT_INIT, TCP_RTO_MAX);

-	refcount_set(&req->rsk_refcnt, 2);
+	refcount_set_release(&req->rsk_refcnt, 2);

  	/* Now finish processing the fastopen child socket. */
  	tcp_init_transfer(child, BPF_SOCK_OPS_PASSIVE_ESTABLISHED_CB, skb);
diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
index 4a481dd4579b..8b8c892810ee 100644
--- a/net/ipv4/tcp_input.c
+++ b/net/ipv4/tcp_input.c
@@ -7069,7 +7069,9 @@ int tcp_conn_request(struct request_sock_ops=20
*rsk_ops,
  		if (!inet_csk_reqsk_queue_add(sk, req, fastopen_sk)) {
  			bh_unlock_sock(fastopen_sk);
  			sock_put(fastopen_sk);
-			goto drop_and_free;
+			/* tcp_disconnect() already dropped one reqsk ref. */
+			reqsk_put(req);
+			goto drop;
  		}
  		sk->sk_data_ready(sk);
  		bh_unlock_sock(fastopen_sk);
diff --git a/net/ipv6/inet6_hashtables.c b/net/ipv6/inet6_hashtables.c
index 869173f176cc..a23cade5fb83 100644
--- a/net/ipv6/inet6_hashtables.c
+++ b/net/ipv6/inet6_hashtables.c
@@ -74,10 +74,12 @@ struct sock *__inet6_lookup_established(struct net=20
*net,
  			continue;
  		if (!inet6_match(net, sk, saddr, daddr, ports, dif, sdif))
  			continue;
-		if (unlikely(!refcount_inc_not_zero(&sk->sk_refcnt)))
+		if (unlikely(!refcount_inc_not_zero_acquire(&sk->sk_refcnt)))
  			goto out;

-		if (unlikely(!inet6_match(net, sk, saddr, daddr, ports, dif, sdif)))=20
{
+		if (unlikely(hlist_nulls_unhashed_lockless(&sk->sk_nulls_node) ||
+			     !inet6_match(net, sk, saddr, daddr, ports, dif,
+					  sdif))) {
  			sock_gen_put(sk);
  			goto begin;
  		}
--=20
2.47.3

patching 5.15.225 LTS -- which I am currently running online.

>=20
> good luck!
>=20
> greg k-h

--=20
Best Professional Regards.

--
Jose R R
http://metztli.it
-------------------------------------------------------------------------=
--------------------
Download Metztli Reiser4: Debian Trixie w/ Linux 5.17.15-3 AMD64
-------------------------------------------------------------------------=
--------------------
feats ZSTD compression https://sf.net/projects/metztli-reiser4/
-------------------------------------------------------------------------=
------------------
Official current Reiser4 resources: https://reiser4.wiki.kernel.org/
--=_6112c175a58b79979067ab7b28da7523
Content-Transfer-Encoding: base64
Content-Type: text/x-diff;
 name=metztli-5_15_225-LTS-NoisyTCP.patch
Content-Disposition: attachment;
 filename=metztli-5_15_225-LTS-NoisyTCP.patch;
 size=10148

RnJvbSAwZTU5NDRhN2FiZTc3N2QyYjhhYWQzNjA0ZjdhNzUzMTk2NmMwNmIxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNZXR6dGxpIEluZm9ybWF0aW9uIFRlY2hub2xvZ3kgPGpvc2VA
bW9pb2NvaWF0emluLm1ldHp0bGkuaXQ+CkRhdGU6IFRodSwgMTkgTm92IDIwMjYgMTQ6NDU6NTQg
LTA4MDAKU3ViamVjdDogW1BBVENIXSA9P1VURi04P3E/QmVzdD0yMGVmZm9ydD0yMDUuMTUuMjI1
PTIwTFRTPTIwYmFja3BvcnQ9MjBwYXQ/PQogPT9VVEYtOD9xP2NoPTIwYWdhaW5zdD0yME5vaXN5
VENQPTIwPUUyPTgwPTk0PTIwQ1ZFLTIwMjYtOTkyODg/PQpNSU1FLVZlcnNpb246IDEuMApDb250
ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKQ29udGVudC1UcmFuc2Zlci1FbmNv
ZGluZzogOGJpdAoKLS0tCiBpbmNsdWRlL2xpbnV4L3JlZmNvdW50LmggICAgICAgIHwgNTUgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiBuZXQvY29yZS9maWx0ZXIuYyAgICAgICAg
ICAgICAgIHwgIDIgKy0KIG5ldC9pcHY0L2luZXRfY29ubmVjdGlvbl9zb2NrLmMgfCAxNiArKysr
KystLS0tCiBuZXQvaXB2NC9pbmV0X2hhc2h0YWJsZXMuYyAgICAgIHwgIDcgKysrLS0KIG5ldC9p
cHY0L2luZXRfdGltZXdhaXRfc29jay5jICAgfCAgNCArLS0KIG5ldC9pcHY0L3N5bmNvb2tpZXMu
YyAgICAgICAgICAgfCAgNCArKy0KIG5ldC9pcHY0L3RjcF9mYXN0b3Blbi5jICAgICAgICAgfCAg
MiArLQogbmV0L2lwdjQvdGNwX2lucHV0LmMgICAgICAgICAgICB8ICA0ICsrLQogbmV0L2lwdjYv
aW5ldDZfaGFzaHRhYmxlcy5jICAgICB8ICA2ICsrLS0KIDkgZmlsZXMgY2hhbmdlZCwgODMgaW5z
ZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9y
ZWZjb3VudC5oIGIvaW5jbHVkZS9saW51eC9yZWZjb3VudC5oCmluZGV4IGI4YTZlMzg3ZjhmOS4u
NDNhMjlmMTVkMDljIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L3JlZmNvdW50LmgKKysrIGIv
aW5jbHVkZS9saW51eC9yZWZjb3VudC5oCkBAIC0xNDIsNiArMTQyLDEwIEBAIHN0YXRpYyBpbmxp
bmUgdm9pZCByZWZjb3VudF9zZXQocmVmY291bnRfdCAqciwgaW50IG4pCiAgKgogICogUmV0dXJu
OiB0aGUgcmVmY291bnQncyB2YWx1ZQogICovCitzdGF0aWMgaW5saW5lIHZvaWQgcmVmY291bnRf
c2V0X3JlbGVhc2UocmVmY291bnRfdCAqciwgaW50IG4pCit7CisJYXRvbWljX3NldF9yZWxlYXNl
KCZyLT5yZWZzLCBuKTsKK30KIHN0YXRpYyBpbmxpbmUgdW5zaWduZWQgaW50IHJlZmNvdW50X3Jl
YWQoY29uc3QgcmVmY291bnRfdCAqcikKIHsKIAlyZXR1cm4gYXRvbWljX3JlYWQoJnItPnJlZnMp
OwpAQCAtMTg4LDYgKzE5Miw0OCBAQCBzdGF0aWMgaW5saW5lIF9fbXVzdF9jaGVjayBib29sIHJl
ZmNvdW50X2FkZF9ub3RfemVybyhpbnQgaSwgcmVmY291bnRfdCAqcikKIAlyZXR1cm4gX19yZWZj
b3VudF9hZGRfbm90X3plcm8oaSwgciwgTlVMTCk7CiB9CiAKK3N0YXRpYyBpbmxpbmUgX19tdXN0
X2NoZWNrCitib29sIF9fcmVmY291bnRfYWRkX25vdF96ZXJvX2xpbWl0ZWRfYWNxdWlyZShpbnQg
aSwgcmVmY291bnRfdCAqciwgaW50ICpvbGRwLAorCQkJCQkgICAgIGludCBsaW1pdCkKK3sKKwlp
bnQgb2xkID0gcmVmY291bnRfcmVhZChyKTsKKworCWRvIHsKKwkJaWYgKCFvbGQpCisJCQlicmVh
azsKKworCQlpZiAoaSA+IGxpbWl0IC0gb2xkKSB7CisJCQlpZiAob2xkcCkKKwkJCQkqb2xkcCA9
IG9sZDsKKwkJCXJldHVybiBmYWxzZTsKKwkJfQorCX0gd2hpbGUgKCFhdG9taWNfdHJ5X2NtcHhj
aGdfYWNxdWlyZSgmci0+cmVmcywgJm9sZCwgb2xkICsgaSkpOworCisJaWYgKG9sZHApCisJCSpv
bGRwID0gb2xkOworCisJaWYgKHVubGlrZWx5KG9sZCA8IDAgfHwgb2xkICsgaSA8IDApKQorCQly
ZWZjb3VudF93YXJuX3NhdHVyYXRlKHIsIFJFRkNPVU5UX0FERF9OT1RfWkVST19PVkYpOworCisJ
cmV0dXJuIG9sZDsKK30KKworc3RhdGljIGlubGluZSBfX211c3RfY2hlY2sgYm9vbAorX19yZWZj
b3VudF9pbmNfbm90X3plcm9fbGltaXRlZF9hY3F1aXJlKHJlZmNvdW50X3QgKnIsIGludCAqb2xk
cCwgaW50IGxpbWl0KQoreworCXJldHVybiBfX3JlZmNvdW50X2FkZF9ub3RfemVyb19saW1pdGVk
X2FjcXVpcmUoMSwgciwgb2xkcCwgbGltaXQpOworfQorCitzdGF0aWMgaW5saW5lIF9fbXVzdF9j
aGVjaworYm9vbCBfX3JlZmNvdW50X2FkZF9ub3RfemVyb19hY3F1aXJlKGludCBpLCByZWZjb3Vu
dF90ICpyLCBpbnQgKm9sZHApCit7CisJcmV0dXJuIF9fcmVmY291bnRfYWRkX25vdF96ZXJvX2xp
bWl0ZWRfYWNxdWlyZShpLCByLCBvbGRwLCBJTlRfTUFYKTsKK30KK3N0YXRpYyBpbmxpbmUgX19t
dXN0X2NoZWNrIGJvb2wgcmVmY291bnRfYWRkX25vdF96ZXJvX2FjcXVpcmUoaW50IGksIHJlZmNv
dW50X3QgKnIpCit7CisJcmV0dXJuIF9fcmVmY291bnRfYWRkX25vdF96ZXJvX2FjcXVpcmUoaSwg
ciwgTlVMTCk7Cit9CisKIHN0YXRpYyBpbmxpbmUgdm9pZCBfX3JlZmNvdW50X2FkZChpbnQgaSwg
cmVmY291bnRfdCAqciwgaW50ICpvbGRwKQogewogCWludCBvbGQgPSBhdG9taWNfZmV0Y2hfYWRk
X3JlbGF4ZWQoaSwgJnItPnJlZnMpOwpAQCAtMjQ1LDYgKzI5MSwxNSBAQCBzdGF0aWMgaW5saW5l
IF9fbXVzdF9jaGVjayBib29sIHJlZmNvdW50X2luY19ub3RfemVybyhyZWZjb3VudF90ICpyKQog
CXJldHVybiBfX3JlZmNvdW50X2luY19ub3RfemVybyhyLCBOVUxMKTsKIH0KIAorc3RhdGljIGlu
bGluZSBfX211c3RfY2hlY2sgYm9vbCBfX3JlZmNvdW50X2luY19ub3RfemVyb19hY3F1aXJlKHJl
ZmNvdW50X3QgKnIsIGludCAqb2xkcCkKK3sKKwlyZXR1cm4gX19yZWZjb3VudF9hZGRfbm90X3pl
cm9fYWNxdWlyZSgxLCByLCBvbGRwKTsKK30KK3N0YXRpYyBpbmxpbmUgX19tdXN0X2NoZWNrIGJv
b2wgcmVmY291bnRfaW5jX25vdF96ZXJvX2FjcXVpcmUocmVmY291bnRfdCAqcikKK3sKKwlyZXR1
cm4gX19yZWZjb3VudF9pbmNfbm90X3plcm9fYWNxdWlyZShyLCBOVUxMKTsKK30KKwogc3RhdGlj
IGlubGluZSB2b2lkIF9fcmVmY291bnRfaW5jKHJlZmNvdW50X3QgKnIsIGludCAqb2xkcCkKIHsK
IAlfX3JlZmNvdW50X2FkZCgxLCByLCBvbGRwKTsKZGlmZiAtLWdpdCBhL25ldC9jb3JlL2ZpbHRl
ci5jIGIvbmV0L2NvcmUvZmlsdGVyLmMKaW5kZXggZjRhNmNhMjNlZWY1Li44ZGUyMGVjNmM1ZjAg
MTAwNjQ0Ci0tLSBhL25ldC9jb3JlL2ZpbHRlci5jCisrKyBiL25ldC9jb3JlL2ZpbHRlci5jCkBA
IC03MTk3LDcgKzcxOTcsNyBAQCBCUEZfQ0FMTF8zKGJwZl9za19hc3NpZ24sIHN0cnVjdCBza19i
dWZmICosIHNrYiwgc3RydWN0IHNvY2sgKiwgc2ssIHU2NCwgZmxhZ3MpCiAJaWYgKHNrX3VuaGFz
aGVkKHNrKSkKIAkJcmV0dXJuIC1FT1BOT1RTVVBQOwogCWlmIChza19pc19yZWZjb3VudGVkKHNr
KSAmJgotCSAgICB1bmxpa2VseSghcmVmY291bnRfaW5jX25vdF96ZXJvKCZzay0+c2tfcmVmY250
KSkpCisJICAgIHVubGlrZWx5KCFyZWZjb3VudF9pbmNfbm90X3plcm9fYWNxdWlyZSgmc2stPnNr
X3JlZmNudCkpKQogCQlyZXR1cm4gLUVOT0VOVDsKIAogCXNrYl9vcnBoYW4oc2tiKTsKZGlmZiAt
LWdpdCBhL25ldC9pcHY0L2luZXRfY29ubmVjdGlvbl9zb2NrLmMgYi9uZXQvaXB2NC9pbmV0X2Nv
bm5lY3Rpb25fc29jay5jCmluZGV4IGFjOWYxODg2MWFhNy4uMzY4MTE5OGU0M2Q5IDEwMDY0NAot
LS0gYS9uZXQvaXB2NC9pbmV0X2Nvbm5lY3Rpb25fc29jay5jCisrKyBiL25ldC9pcHY0L2luZXRf
Y29ubmVjdGlvbl9zb2NrLmMKQEAgLTg2Myw4ICs4NjMsOCBAQCBzdGF0aWMgdm9pZCByZXFza190
aW1lcl9oYW5kbGVyKHN0cnVjdCB0aW1lcl9saXN0ICp0KQogCQkgKiBob2xkIGFub3RoZXIgY291
bnQgdG8gcHJldmVudCB1c2UtYWZ0ZXItZnJlZSBhbmQKIAkJICogY2FsbCByZXFza19wdXQoKSBq
dXN0IGJlZm9yZSByZXR1cm4uCiAJCSAqLwotCQlyZWZjb3VudF9zZXQoJm5yZXEtPnJza19yZWZj
bnQsIDIgKyAxKTsKIAkJdGltZXJfc2V0dXAoJm5yZXEtPnJza190aW1lciwgcmVxc2tfdGltZXJf
aGFuZGxlciwgVElNRVJfUElOTkVEKTsKKwkJcmVmY291bnRfc2V0X3JlbGVhc2UoJm5yZXEtPnJz
a19yZWZjbnQsIDIgKyAxKTsKIAkJcmVxc2tfcXVldWVfbWlncmF0ZWQoJmluZXRfY3NrKG5zaykt
Pmljc2tfYWNjZXB0X3F1ZXVlLCByZXEpOwogCiAJCXJlcSA9IG5yZXE7CkBAIC05MzksMTAgKzkz
OSwxNCBAQCBzdGF0aWMgdm9pZCByZXFza190aW1lcl9oYW5kbGVyKHN0cnVjdCB0aW1lcl9saXN0
ICp0KQogCSAqLwogCWlmIChucmVxKSB7CiAJCV9fTkVUX0lOQ19TVEFUUyhuZXQsIExJTlVYX01J
Ql9UQ1BNSUdSQVRFUkVRRkFJTFVSRSk7CisJCS8qIFRoZSB0aW1lciB3YXMgbm90IGFybWVkLCBk
cm9wIGl0cyByZWZlcmVuY2UgaGVyZS4gKi8KKwkJcmVxc2tfcHV0KG5yZXEpOwogbm9fb3duZXJz
aGlwOgogCQlyZXFza19taWdyYXRlX3Jlc2V0KG5yZXEpOwogCQlyZXFza19xdWV1ZV9yZW1vdmVk
KHF1ZXVlLCBucmVxKTsKLQkJX19yZXFza19mcmVlKG5yZXEpOworCQkvKiBEcm9wIHRoZSB0ZW1w
b3JhcnkgcmVmZXJlbmNlIGFuZCB0aGUgb25lIHJlc2VydmVkIGZvciBlaGFzaC4gKi8KKwkJcmVx
c2tfcHV0KG5yZXEpOworCQlyZXFza19wdXQobnJlcSk7CiAJfQogCiBkcm9wOgpAQCAtMTIxNiw3
ICsxMjIwLDcgQEAgc3RydWN0IHNvY2sgKmluZXRfY3NrX2NvbXBsZXRlX2hhc2hkYW5jZShzdHJ1
Y3Qgc29jayAqc2ssIHN0cnVjdCBzb2NrICpjaGlsZCwKIAkJCQlnb3RvIGNoaWxkX3B1dDsKIAkJ
CX0KIAotCQkJcmVmY291bnRfc2V0KCZucmVxLT5yc2tfcmVmY250LCAxKTsKKwkJCXJlZmNvdW50
X3NldF9yZWxlYXNlKCZucmVxLT5yc2tfcmVmY250LCAxKTsKIAkJCWlmIChpbmV0X2Nza19yZXFz
a19xdWV1ZV9hZGQoc2ssIG5yZXEsIGNoaWxkKSkgewogCQkJCV9fTkVUX0lOQ19TVEFUUyhzb2Nr
X25ldChzayksIExJTlVYX01JQl9UQ1BNSUdSQVRFUkVRU1VDQ0VTUyk7CiAJCQkJcmVxc2tfbWln
cmF0ZV9yZXNldChyZXEpOwpAQCAtMTIyNiw3ICsxMjMwLDcgQEAgc3RydWN0IHNvY2sgKmluZXRf
Y3NrX2NvbXBsZXRlX2hhc2hkYW5jZShzdHJ1Y3Qgc29jayAqc2ssIHN0cnVjdCBzb2NrICpjaGls
ZCwKIAogCQkJX19ORVRfSU5DX1NUQVRTKHNvY2tfbmV0KHNrKSwgTElOVVhfTUlCX1RDUE1JR1JB
VEVSRVFGQUlMVVJFKTsKIAkJCXJlcXNrX21pZ3JhdGVfcmVzZXQobnJlcSk7Ci0JCQlfX3JlcXNr
X2ZyZWUobnJlcSk7CisJCQlyZXFza19wdXQobnJlcSk7CiAJCX0gZWxzZSBpZiAoaW5ldF9jc2tf
cmVxc2tfcXVldWVfYWRkKHNrLCByZXEsIGNoaWxkKSkgewogCQkJcmV0dXJuIGNoaWxkOwogCQl9
CkBAIC0xMjcwLDcgKzEyNzQsNyBAQCB2b2lkIGluZXRfY3NrX2xpc3Rlbl9zdG9wKHN0cnVjdCBz
b2NrICpzaykKIAkJaWYgKG5zaykgewogCQkJbnJlcSA9IGluZXRfcmVxc2tfY2xvbmUocmVxLCBu
c2spOwogCQkJaWYgKG5yZXEpIHsKLQkJCQlyZWZjb3VudF9zZXQoJm5yZXEtPnJza19yZWZjbnQs
IDEpOworCQkJCXJlZmNvdW50X3NldF9yZWxlYXNlKCZucmVxLT5yc2tfcmVmY250LCAxKTsKIAog
CQkJCXJjdV9yZWFkX2xvY2soKTsKIAkJCQlpZiAoaW5ldF9jc2tfcmVxc2tfcXVldWVfYWRkKG5z
aywgbnJlcSwgY2hpbGQpKSB7CkBAIC0xMjgyLDcgKzEyODYsNyBAQCB2b2lkIGluZXRfY3NrX2xp
c3Rlbl9zdG9wKHN0cnVjdCBzb2NrICpzaykKIAkJCQkJX19ORVRfSU5DX1NUQVRTKHNvY2tfbmV0
KG5zayksCiAJCQkJCQkJTElOVVhfTUlCX1RDUE1JR1JBVEVSRVFGQUlMVVJFKTsKIAkJCQkJcmVx
c2tfbWlncmF0ZV9yZXNldChucmVxKTsKLQkJCQkJX19yZXFza19mcmVlKG5yZXEpOworCQkJCQly
ZXFza19wdXQobnJlcSk7CiAJCQkJfQogCQkJCXJjdV9yZWFkX3VubG9jaygpOwogCmRpZmYgLS1n
aXQgYS9uZXQvaXB2NC9pbmV0X2hhc2h0YWJsZXMuYyBiL25ldC9pcHY0L2luZXRfaGFzaHRhYmxl
cy5jCmluZGV4IGE3ZDExYjgyZmU2NC4uZGM3YWI5MmM4OTc4IDEwMDY0NAotLS0gYS9uZXQvaXB2
NC9pbmV0X2hhc2h0YWJsZXMuYworKysgYi9uZXQvaXB2NC9pbmV0X2hhc2h0YWJsZXMuYwpAQCAt
MzgxLDEwICszODEsMTEgQEAgc3RydWN0IHNvY2sgKl9faW5ldF9sb29rdXBfZXN0YWJsaXNoZWQo
c3RydWN0IG5ldCAqbmV0LAogCQlpZiAoc2stPnNrX2hhc2ggIT0gaGFzaCkKIAkJCWNvbnRpbnVl
OwogCQlpZiAobGlrZWx5KElORVRfTUFUQ0gobmV0LCBzaywgYWNvb2tpZSwgcG9ydHMsIGRpZiwg
c2RpZikpKSB7Ci0JCQlpZiAodW5saWtlbHkoIXJlZmNvdW50X2luY19ub3RfemVybygmc2stPnNr
X3JlZmNudCkpKQorCQkJaWYgKHVubGlrZWx5KCFyZWZjb3VudF9pbmNfbm90X3plcm9fYWNxdWly
ZSgmc2stPnNrX3JlZmNudCkpKQogCQkJCWdvdG8gb3V0OwotCQkJaWYgKHVubGlrZWx5KCFJTkVU
X01BVENIKG5ldCwgc2ssIGFjb29raWUsCi0JCQkJCQkgcG9ydHMsIGRpZiwgc2RpZikpKSB7CisJ
CQlpZiAodW5saWtlbHkoaGxpc3RfbnVsbHNfdW5oYXNoZWRfbG9ja2xlc3MoJnNrLT5za19udWxs
c19ub2RlKSB8fAorCQkJCSAgICAgIUlORVRfTUFUQ0gobmV0LCBzaywgYWNvb2tpZSwgcG9ydHMs
IGRpZiwKKwkJCQkJCSBzZGlmKSkpIHsKIAkJCQlzb2NrX2dlbl9wdXQoc2spOwogCQkJCWdvdG8g
YmVnaW47CiAJCQl9CmRpZmYgLS1naXQgYS9uZXQvaXB2NC9pbmV0X3RpbWV3YWl0X3NvY2suYyBi
L25ldC9pcHY0L2luZXRfdGltZXdhaXRfc29jay5jCmluZGV4IDI1ODA5ZTA2ZjExMS4uYWFlMDU2
MDg5MTU3IDEwMDY0NAotLS0gYS9uZXQvaXB2NC9pbmV0X3RpbWV3YWl0X3NvY2suYworKysgYi9u
ZXQvaXB2NC9pbmV0X3RpbWV3YWl0X3NvY2suYwpAQCAtMTM3LDcgKzEzNyw3IEBAIHZvaWQgaW5l
dF90d3NrX2hhc2hkYW5jZShzdHJ1Y3QgaW5ldF90aW1ld2FpdF9zb2NrICp0dywgc3RydWN0IHNv
Y2sgKnNrLAogCSAqIEFsc28gbm90ZSB0aGF0IGFmdGVyIHRoaXMgcG9pbnQsIHdlIGxvc3Qgb3Vy
IGltcGxpY2l0IHJlZmVyZW5jZQogCSAqIHNvIHdlIGFyZSBub3QgYWxsb3dlZCB0byB1c2UgdHcg
YW55bW9yZS4KIAkgKi8KLQlyZWZjb3VudF9zZXQoJnR3LT50d19yZWZjbnQsIDMpOworCXJlZmNv
dW50X3NldF9yZWxlYXNlKCZ0dy0+dHdfcmVmY250LCAzKTsKIH0KIEVYUE9SVF9TWU1CT0xfR1BM
KGluZXRfdHdza19oYXNoZGFuY2UpOwogCkBAIC0yNzgsNyArMjc4LDcgQEAgdm9pZCBpbmV0X3R3
c2tfcHVyZ2Uoc3RydWN0IGluZXRfaGFzaGluZm8gKmhhc2hpbmZvLCBpbnQgZmFtaWx5KQogCQkJ
ICAgIHJlZmNvdW50X3JlYWQoJnNvY2tfbmV0KHNrKS0+bnMuY291bnQpKQogCQkJCWNvbnRpbnVl
OwogCi0JCQlpZiAodW5saWtlbHkoIXJlZmNvdW50X2luY19ub3RfemVybygmc2stPnNrX3JlZmNu
dCkpKQorCQkJaWYgKHVubGlrZWx5KCFyZWZjb3VudF9pbmNfbm90X3plcm9fYWNxdWlyZSgmc2st
PnNrX3JlZmNudCkpKQogCQkJCWNvbnRpbnVlOwogCiAJCQlpZiAodW5saWtlbHkoc2stPnNrX2Zh
bWlseSAhPSBmYW1pbHkgfHwKZGlmZiAtLWdpdCBhL25ldC9pcHY0L3N5bmNvb2tpZXMuYyBiL25l
dC9pcHY0L3N5bmNvb2tpZXMuYwppbmRleCA1YTYxZjlhMzY0YWQuLmVlMzllYzY0NTJlMyAxMDA2
NDQKLS0tIGEvbmV0L2lwdjQvc3luY29va2llcy5jCisrKyBiL25ldC9pcHY0L3N5bmNvb2tpZXMu
YwpAQCAtMjAzLDcgKzIwMyw3IEBAIHN0cnVjdCBzb2NrICp0Y3BfZ2V0X2Nvb2tpZV9zb2NrKHN0
cnVjdCBzb2NrICpzaywgc3RydWN0IHNrX2J1ZmYgKnNrYiwKIAljaGlsZCA9IGljc2stPmljc2tf
YWZfb3BzLT5zeW5fcmVjdl9zb2NrKHNrLCBza2IsIHJlcSwgZHN0LAogCQkJCQkJIE5VTEwsICZv
d25fcmVxLCBOVUxMKTsKIAlpZiAoY2hpbGQpIHsKLQkJcmVmY291bnRfc2V0KCZyZXEtPnJza19y
ZWZjbnQsIDEpOworCQlyZWZjb3VudF9zZXRfcmVsZWFzZSgmcmVxLT5yc2tfcmVmY250LCAxKTsK
IAkJdGNwX3NrKGNoaWxkKS0+dHNvZmZzZXQgPSB0c29mZjsKIAkJc29ja19ycHNfc2F2ZV9yeGhh
c2goY2hpbGQsIHNrYik7CiAKQEAgLTIxNyw2ICsyMTcsOCBAQCBzdHJ1Y3Qgc29jayAqdGNwX2dl
dF9jb29raWVfc29jayhzdHJ1Y3Qgc29jayAqc2ssIHN0cnVjdCBza19idWZmICpza2IsCiAKIAkJ
YmhfdW5sb2NrX3NvY2soY2hpbGQpOwogCQlzb2NrX3B1dChjaGlsZCk7CisJCXJlcXNrX3B1dChy
ZXEpOworCQlyZXR1cm4gTlVMTDsKIAl9CiAJX19yZXFza19mcmVlKHJlcSk7CiAKZGlmZiAtLWdp
dCBhL25ldC9pcHY0L3RjcF9mYXN0b3Blbi5jIGIvbmV0L2lwdjQvdGNwX2Zhc3RvcGVuLmMKaW5k
ZXggZjNlZDdkNWZmN2VmLi5mZmE5NzVjZWI5NDYgMTAwNjQ0Ci0tLSBhL25ldC9pcHY0L3RjcF9m
YXN0b3Blbi5jCisrKyBiL25ldC9pcHY0L3RjcF9mYXN0b3Blbi5jCkBAIC0yODEsNyArMjgxLDcg
QEAgc3RhdGljIHN0cnVjdCBzb2NrICp0Y3BfZmFzdG9wZW5fY3JlYXRlX2NoaWxkKHN0cnVjdCBz
b2NrICpzaywKIAlpbmV0X2Nza19yZXNldF94bWl0X3RpbWVyKGNoaWxkLCBJQ1NLX1RJTUVfUkVU
UkFOUywKIAkJCQkgIFRDUF9USU1FT1VUX0lOSVQsIFRDUF9SVE9fTUFYKTsKIAotCXJlZmNvdW50
X3NldCgmcmVxLT5yc2tfcmVmY250LCAyKTsKKwlyZWZjb3VudF9zZXRfcmVsZWFzZSgmcmVxLT5y
c2tfcmVmY250LCAyKTsKIAogCS8qIE5vdyBmaW5pc2ggcHJvY2Vzc2luZyB0aGUgZmFzdG9wZW4g
Y2hpbGQgc29ja2V0LiAqLwogCXRjcF9pbml0X3RyYW5zZmVyKGNoaWxkLCBCUEZfU09DS19PUFNf
UEFTU0lWRV9FU1RBQkxJU0hFRF9DQiwgc2tiKTsKZGlmZiAtLWdpdCBhL25ldC9pcHY0L3RjcF9p
bnB1dC5jIGIvbmV0L2lwdjQvdGNwX2lucHV0LmMKaW5kZXggNGE0ODFkZDQ1NzliLi44YjhjODky
ODEwZWUgMTAwNjQ0Ci0tLSBhL25ldC9pcHY0L3RjcF9pbnB1dC5jCisrKyBiL25ldC9pcHY0L3Rj
cF9pbnB1dC5jCkBAIC03MDY5LDcgKzcwNjksOSBAQCBpbnQgdGNwX2Nvbm5fcmVxdWVzdChzdHJ1
Y3QgcmVxdWVzdF9zb2NrX29wcyAqcnNrX29wcywKIAkJaWYgKCFpbmV0X2Nza19yZXFza19xdWV1
ZV9hZGQoc2ssIHJlcSwgZmFzdG9wZW5fc2spKSB7CiAJCQliaF91bmxvY2tfc29jayhmYXN0b3Bl
bl9zayk7CiAJCQlzb2NrX3B1dChmYXN0b3Blbl9zayk7Ci0JCQlnb3RvIGRyb3BfYW5kX2ZyZWU7
CisJCQkvKiB0Y3BfZGlzY29ubmVjdCgpIGFscmVhZHkgZHJvcHBlZCBvbmUgcmVxc2sgcmVmLiAq
LworCQkJcmVxc2tfcHV0KHJlcSk7CisJCQlnb3RvIGRyb3A7CiAJCX0KIAkJc2stPnNrX2RhdGFf
cmVhZHkoc2spOwogCQliaF91bmxvY2tfc29jayhmYXN0b3Blbl9zayk7CmRpZmYgLS1naXQgYS9u
ZXQvaXB2Ni9pbmV0Nl9oYXNodGFibGVzLmMgYi9uZXQvaXB2Ni9pbmV0Nl9oYXNodGFibGVzLmMK
aW5kZXggODY5MTczZjE3NmNjLi5hMjNjYWRlNWZiODMgMTAwNjQ0Ci0tLSBhL25ldC9pcHY2L2lu
ZXQ2X2hhc2h0YWJsZXMuYworKysgYi9uZXQvaXB2Ni9pbmV0Nl9oYXNodGFibGVzLmMKQEAgLTc0
LDEwICs3NCwxMiBAQCBzdHJ1Y3Qgc29jayAqX19pbmV0Nl9sb29rdXBfZXN0YWJsaXNoZWQoc3Ry
dWN0IG5ldCAqbmV0LAogCQkJY29udGludWU7CiAJCWlmICghaW5ldDZfbWF0Y2gobmV0LCBzaywg
c2FkZHIsIGRhZGRyLCBwb3J0cywgZGlmLCBzZGlmKSkKIAkJCWNvbnRpbnVlOwotCQlpZiAodW5s
aWtlbHkoIXJlZmNvdW50X2luY19ub3RfemVybygmc2stPnNrX3JlZmNudCkpKQorCQlpZiAodW5s
aWtlbHkoIXJlZmNvdW50X2luY19ub3RfemVyb19hY3F1aXJlKCZzay0+c2tfcmVmY250KSkpCiAJ
CQlnb3RvIG91dDsKIAotCQlpZiAodW5saWtlbHkoIWluZXQ2X21hdGNoKG5ldCwgc2ssIHNhZGRy
LCBkYWRkciwgcG9ydHMsIGRpZiwgc2RpZikpKSB7CisJCWlmICh1bmxpa2VseShobGlzdF9udWxs
c191bmhhc2hlZF9sb2NrbGVzcygmc2stPnNrX251bGxzX25vZGUpIHx8CisJCQkgICAgICFpbmV0
Nl9tYXRjaChuZXQsIHNrLCBzYWRkciwgZGFkZHIsIHBvcnRzLCBkaWYsCisJCQkJCSAgc2RpZikp
KSB7CiAJCQlzb2NrX2dlbl9wdXQoc2spOwogCQkJZ290byBiZWdpbjsKIAkJfQotLSAKMi40Ny4z
Cgo=
--=_6112c175a58b79979067ab7b28da7523--
