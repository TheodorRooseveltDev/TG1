import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';

class AuthService {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  static const String _tokenKey = 'auth_token';
  static const String _userKey = 'user_data';

  // Simulate API calls (replace with real API in production)
  
  Future<User?> login(String email, String password) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));
    
    // Simple validation for demo (replace with real API)
    if (password.length < 6) {
      throw Exception('Invalid credentials');
    }
    
    // Create mock user
    final user = User(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      email: email,
      username: email.split('@')[0],
      totalScore: 0,
      quizzesCompleted: 0,
    );
    
    // Store auth token
    await _secureStorage.write(key: _tokenKey, value: 'mock_token_${user.id}');
    
    // Store user data
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userKey, user.toJson().toString());
    
    return user;
  }

  Future<User?> register(String email, String username, String password) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));
    
    // Simple validation
    if (password.length < 6) {
      throw Exception('Password must be at least 6 characters');
    }
    
    if (username.length < 3) {
      throw Exception('Username must be at least 3 characters');
    }
    
    // Create new user
    final user = User(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      email: email,
      username: username,
      totalScore: 0,
      quizzesCompleted: 0,
    );
    
    // Store auth token
    await _secureStorage.write(key: _tokenKey, value: 'mock_token_${user.id}');
    
    // Store user data
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userKey, user.toJson().toString());
    
    return user;
  }

  Future<void> logout() async {
    await _secureStorage.delete(key: _tokenKey);
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userKey);
  }

  Future<String?> getToken() async {
    return await _secureStorage.read(key: _tokenKey);
  }

  Future<bool> isLoggedIn() async {
    final token = await getToken();
    return token != null && token.isNotEmpty;
  }

  Future<User?> getCurrentUser() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userData = prefs.getString(_userKey);
      if (userData != null) {
        // Parse stored user data (simplified for demo)
        // In production, use proper JSON parsing
        return null; // Return parsed user
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
