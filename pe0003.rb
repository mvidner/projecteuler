def sieve(prime, candidates)
  candidates.reject! { |n| n % prime == 0 }
end

def build_candidates(n, primes)
  (2..n).reject {|x| primes.any? {|p| x % p == 0 } }
end

def primes_until(n)
  primes = [2, 3, 5, 7, 11, 13, 17, 19]
  puts Time.now
  candidates = primes + build_candidates(n, primes)
  limit = Math.sqrt(n).floor

  t1 = Time.now
  puts t1

  loop do
    prime = candidates.shift
    primes << prime
    break if prime > limit
    sieve prime, candidates

    t2 = Time.now
    tdiff = t2 - t1
    if tdiff > 1
      puts "%d: %d candidates in %.1fs" % [prime, candidates.size, tdiff]
      t1 = t2
    end
  end
  primes + candidates
end

def largest_prime_factor(n)
  limit = Math.sqrt(n).floor
  puts "limit %d" % limit
  candidate_factors = primes_until limit
  candidate_factors.reverse_each do |p|
    return p if n % p == 0
  end
end

def pe0003
  puts largest_prime_factor 600851475143
end
