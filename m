From: Nikita Danilov <nikita@clusterfs.com>
Subject: Re: we have got hash function screwed up
Date: Tue, 6 Sep 2005 15:23:44 +0400
Message-ID: <17181.31808.350568.841492@gargle.gargle.HOWL>
References: <431C738F.4010803@freemail.hu>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="N3sEURFzu3"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25873-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <431C738F.4010803@freemail.hu>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Gabor HALASZ <halasz.g@freemail.hu>
Cc: Reiserfs mail-list <Reiserfs-List@Namesys.COM>

--N3sEURFzu3
Content-Type: text/plain; charset=us-ascii
Content-Description: message body text
Content-Transfer-Encoding: 7bit

Gabor HALASZ writes:
 > Hi!
 > 
 > I got the next message:
 > 
 > Sep  5 17:48:32 sk8n kernel: ReiserFS: dm-10: warning: 
 > reiserfs_add_entry: Congratulations! we have got hash function screwed up

reiserfs v3 uses a hash of the file name as a part of a tree key to
store directory entry for that name. To handle "hash collisions" i.e.,
situations when different names have the same hash "generation counter"
is appended to the hash to make the key unique. As generation counter is
8 bits, reiserfs handles up to 255 file names with the same hash value
in the same directory.

When generation counter "overflows" there is no way to generate unique
key and reiserfs refuses to create new file with (somewhat arbitrary)
-EBUSY error. This is usually rather hard to trigger (hence
"congratulations" bit): with the default r5 hash it takes about 1.5M
random file names to start getting generation counter overflowing.

It seems that in your case ".in.xserver-xorg_6.8.2.dfsg.1-6_i386.deb"
file name falls into already full hash bin. Depending on what you are
doing you might try one of the following:

 - find other files in that bin and remove or rename some of them. That
 would allow ".in.xserver-xorg_6.8.2.dfsg.1-6_i386.deb" to be created,
 but the problem might recur in the future;

 - re-create file system with the tea hash. That hash permutes bits
 thoroughly and it's much harder (albeit still possible) to get -EBUSY
 with it. Note however, that due to that randomization, directory
 operations are usually slower with the tea hash.

I am attaching simple program to calculate hashes. Build it and use as

ls -A /home/ftpd/pub/debian/pool/main/x/xorg-x11/ |\
        /path-to/r5 r5 | <...some uniq/awk/perl/sh glue to find duplicates...>

 > 
 > -- 
 > Gabor HALASZ <halasz.g@freemail.hu>
 > 

Nikita.

--N3sEURFzu3
Content-Type: text/plain
Content-Disposition: inline;
	filename="r5.c"
Content-Transfer-Encoding: 7bit

#include <stdio.h>
#include <stdlib.h>

unsigned long r5e_hash (const char *s)
{
  unsigned int h=0;
  while (*s) {
    h += *s++ + h<<3 + h<<1;
    h <<= 3;
  }
  return h;
}

unsigned long r5l_hash( const char *msg )
{
    unsigned long a = 0;

    for( ; *msg ; ++msg ) 
	  { 
		a *= 11;
		a += *msg << 4;
		a += *msg >> 4;
	  }
    return a;
}

unsigned long r5_hash (const char *msg)
{
  unsigned long a = 0;

  for( ; *msg ; ++msg ) {
    a += *msg << 4;
    a += *msg >> 4;
    a *= 11;
   } 
  return a;
}

unsigned long r5mod_hash( const char *msg )
{
    unsigned long a = 0;

    for( ; *msg ; ++msg ) 
	  { 
		a *= 11;
		if( a == 0 )
		  {
			a += 0xacc01ade;
		  }
		a += *msg << 4;
		a += *msg >> 4;
	  }
    return a;
}

unsigned long r5ul_hash( const char *smsg )
{
  const unsigned char *msg = ( const unsigned char * )smsg;
  unsigned long a = 0;

  for( ; *msg ; ++msg ) {
    a += ( ( unsigned long )*msg ) << 4;
	a += ( ( unsigned long )*msg ) >> 4;
    a *= 11;
   } 
  return a;
}

unsigned short swab( unsigned short word )
{
  return ( word << 8 ) | ( word >> 8 );
}

unsigned long r5xxx_hash( const char *msg )
{
  unsigned long a;

  for( a = 0 ; *msg ; ++msg ) 
	{
	  a *= 11;
	  a += a % 0x7ffffff;
	  a += ( *msg << 4 ) + ( *msg >> 4 );
	}
  return a;
}

unsigned long fnv_1_hash( const char *smsg )
{
  unsigned long a = 0x811c9dc5;
  const unsigned long fnv_32_prime = 0x01000193;
  unsigned char *msg = ( unsigned char * )smsg;

  /*
   * FNV-1 hash each octet in the buffer
   */
  for( ; *msg ; ++msg ) 
	{

	  /* multiply by the 32 bit FNV magic prime mod 2^64 */
	  a *= fnv_32_prime;

	  /* xor the bottom with the current octet */
	  a ^= ( unsigned long ) ( *msg );
    }

    /* return our new hash value */
    return a;
}

unsigned long fnv_1_64_hash( const char *mes )
{
	unsigned long long a = 0xcbf29ce484222325ull;
	const unsigned long long fnv_64_prime = 0x100000001b3ull;
	const unsigned char *name;

	name = mes;
	/* FNV-1 hash each octet in the buffer */
	for( ; *name ; ++name ) {
		/* multiply by the 32 bit FNV magic prime mod 2^64 */
		a *= fnv_64_prime;
		/* xor the bottom with the current octet */
		a ^= ( unsigned long long ) ( *name );
	}
	/* return our new hash value */
	return a;
}

/*
 * XFS hash: fs/xfs/xfs_da_btree.c:xfs_da_hashname()
 *
 * Implement a simple hash on a character string.
 * Rotate the hash value by 7 bits, then XOR each character in.
 * This is implemented with some source-level loop unrolling.
 */
unsigned long xfs_da_hash( const char *mes )
{
  const unsigned char *name;
  int namelen;
  unsigned long hash;

  name = ( const unsigned char * ) mes;
  namelen = strlen( mes );

#define ROTL(x,y)	(((x) << (y)) | ((x) >> (32 - (y))))
#ifdef SLOWVERSION
	/*
	 * This is the old one-byte-at-a-time version.
	 */
	for (hash = 0; namelen > 0; namelen--) {
		hash = *name++ ^ ROTL(hash, 7);
	}
	return(hash);
#else
	/*
	 * Do four characters at a time as long as we can.
	 */
	for (hash = 0; namelen >= 4; namelen -= 4, name += 4) {
		hash = (name[0] << 21) ^ (name[1] << 14) ^ (name[2] << 7) ^
		       (name[3] << 0) ^ ROTL(hash, 7 * 4);
	}
	/*
	 * Now do the rest of the characters.
	 */
	switch (namelen) {
	case 3:
		return (name[0] << 14) ^ (name[1] << 7) ^ (name[2] << 0) ^
		       ROTL(hash, 7 * 3);
	case 2:
		return (name[0] << 7) ^ (name[1] << 0) ^ ROTL(hash, 7 * 2);
	case 1:
		return (name[0] << 0) ^ ROTL(hash, 7 * 1);
	case 0:
		return hash;
	}
	/* NOTREACHED */
#endif
#undef ROTL
	return 0; /* keep gcc happy */
}

#define HASH( h ) { .name = #h, .hash = h ## _hash }
struct 
{
  const char *name;
  unsigned long ( *hash )( const char * );
} hashes [] = {
  HASH( r5 ),
  HASH( r5l ),
  HASH( r5mod ),
  HASH( r5xxx ),
  HASH( r5ul ),
  HASH( r5e ),
  HASH( fnv_1 ),
  HASH( fnv_1_64 ),
  HASH( xfs_da ),
  { .name = NULL, .hash = NULL }
};

static void usage( const char *pname )
{
  int i;

  fprintf( stderr, "%s %s", pname, hashes[ 0 ].name );
  for( i = 1 ; hashes[ i ].name != NULL ; ++ i ) 
	{
	  fprintf( stderr, "|%s", hashes[ i ].name );
	}
  fprintf( stderr, "\n" );
}

int main( int argc, char **argv )
{
  unsigned long ( *hash )( const char *name );
  int i;
  char fname[ 10000 ];

  if( argc > 1 )
	{
	  hash = NULL;
	  for( i = 0 ; hashes[ i ].name != NULL ; ++ i ) 
		{
		  if( !strcmp( argv[ 1 ], hashes[ i ].name ) )
			{
			  hash = hashes[ i ].hash;
			}
		}
	  if( hash == NULL )
		{
		  fprintf( stderr, "unknown hash: %s", argv[ 1 ] );
		  usage( argv[ 0 ] );
		}
	  else if( argc > 2 )
		{
		  for( i = 2 ; i < argc ; ++i )
			{
			  printf( "%lx\t%s\n", hash( argv[ i ] ), argv[ i ] );
			}
		}
	  else
		{
		  while( gets( fname ) )
			{
			  printf( "%lx\t%s\n", hash( fname ), fname );
			}
		}
	}
  else
	{
	  usage( argv[ 0 ] );
	}
  return EXIT_SUCCESS;
}


--N3sEURFzu3--
